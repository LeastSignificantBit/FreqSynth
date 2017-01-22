/*
 * main.cpp
 * Copyright (C) 2016  Martin Berglund
 * This source file is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this file; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */
#include "stm32f0xx_hal.h"
#include "adc.h"
#include "spi.h"
#include "usart.h"
#include "gpio.h"
#include "comminterface.h"
#include "max2870.h"
#include "printf.h"
#include "freqsynthsystem.h"

void test(__attribute__((unused)) int argc,__attribute__((unused)) char* argv[]);
void fallback(__attribute__((unused)) int argc,__attribute__((unused)) char* argv[]);
void loop(__attribute__((unused)) int argc,__attribute__((unused)) char* argv[]);
void SystemClock_Config(void);
void myputc ( void* p, char c);
void Error_Handler(void);

MAX2870 PLLChip(&hspi1, CS_PLL_GPIO_Port, CS_PLL_Pin,
            CE_PLL_GPIO_Port, CE_PLL_Pin,
            EN_PLL_GPIO_Port, EN_PLL_Pin,
            LD_PLL_GPIO_Port, LD_PLL_Pin);

Powermeter_LMH2110 PowerMeter( &hadc );

FilterSelect FilterBank(FILT1_GPIO_Port, FILT1_Pin,
                        FILT2_GPIO_Port, FILT2_Pin,
                        FILT3_GPIO_Port, FILT3_Pin,
                        FILT4_GPIO_Port, FILT4_Pin);

Atten_PE43711 Attenuator(&hspi1, ATTEN_CS_GPIO_Port, ATTEN_CS_Pin);

CommInterface ci(&huart1, *Fallback);

int main(void)
{
    /* Init */
    HAL_Init();
    SystemClock_Config();
    MX_GPIO_Init();
    MX_ADC_Init();
    MX_SPI1_Init();
    MX_USART1_UART_Init(); // http://stackoverflow.com/questions/24875873/stm32f4-uart-hal-driver

    init_printf((void *)&huart1,*myputc);

    HAL_GPIO_WritePin(PWDWN_GPIO_Port, PWDWN_Pin, GPIO_PIN_SET);
    HAL_GPIO_WritePin(INT_CLK_EN_GPIO_Port, INT_CLK_EN_Pin, GPIO_PIN_SET);

    Attenuator.SetAtt(0);

    FilterBank.UseFilterNo(0);

    PLLChip.Init();
    PLLChip.SetParam(PLLChip.MUX, 12);
    PLLChip.SetParam(PLLChip.SHDN, 1);

    ci.Attatch("SPR", *SetPLLReg);
    ci.Attatch("STS", *GetPLLStatus);
    ci.Attatch("SPP", *SetPLLParam);
    ci.Attatch("RPR", *ResetPLLReg);
    ci.Attatch("RP", *ReadPower);
    ci.Attatch("AOFF", *AmpOff);
    ci.Attatch("AON", *AmpOn);
    ci.Attatch("SA", *SetAttenuation);
    ci.Attatch("SF", *SetFilter);
    ci.Attatch("RFON", *RFOn);
    ci.Attatch("RFOFF", *RFOff);
    ci.Run();

    return 0;
}


/** System Clock Configuration **/
void SystemClock_Config(void)
{

    RCC_OscInitTypeDef RCC_OscInitStruct;
    RCC_ClkInitTypeDef RCC_ClkInitStruct;
    RCC_PeriphCLKInitTypeDef PeriphClkInit;

    RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI|RCC_OSCILLATORTYPE_HSI14;
    RCC_OscInitStruct.HSIState = RCC_HSI_ON;
    RCC_OscInitStruct.HSI14State = RCC_HSI14_ON;
    RCC_OscInitStruct.HSICalibrationValue = 16;
    RCC_OscInitStruct.HSI14CalibrationValue = 16;
    RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;
    if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
    {
        Error_Handler();
    }

    RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
            |RCC_CLOCKTYPE_PCLK1;
    RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_HSI;
    RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
    RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
    if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_0) != HAL_OK)
    {
        Error_Handler();
    }

    PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_USART1;
    PeriphClkInit.Usart1ClockSelection = RCC_USART1CLKSOURCE_PCLK1;
    if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
    {
        Error_Handler();
    }

    HAL_SYSTICK_Config(HAL_RCC_GetHCLKFreq()/1000);

    HAL_SYSTICK_CLKSourceConfig(SYSTICK_CLKSOURCE_HCLK);

    /* SysTick_IRQn interrupt configuration */
    HAL_NVIC_SetPriority(SysTick_IRQn, 0, 0);
}

void myputc ( void* p, char c)
{
    if(HAL_UART_Transmit((UART_HandleTypeDef *) p,(uint8_t*) &c, 1, 10) != HAL_OK)
    {
        Error_Handler();
    }

}

void Error_Handler(void)
{

    printf("==== ERROR ====\n");
    while(1)
    {
        HAL_GPIO_TogglePin(RED_LED_GPIO_Port, RED_LED_Pin);
        HAL_Delay(100);
    }
}


/** We need these for housekeeping */
namespace std {
void __throw_bad_alloc()
{
    Error_Handler();
    for(;;){}
}

void __throw_length_error(__attribute__((unused))  char const*e )
{
    Error_Handler();
    for(;;){}
}
}

