#include "stm32f0xx_hal.h"
#include "adc.h"
#include "spi.h"
#include "usart.h"
#include "gpio.h"
#include "comminterface.h"

void test(__attribute__((unused)) int argc,__attribute__((unused)) char* argv[]);
void fallback(__attribute__((unused)) int argc,__attribute__((unused)) char* argv[]);
void loop(__attribute__((unused)) int argc,__attribute__((unused)) char* argv[]);
void SystemClock_Config(void);
void Error_Handler(void);

int main(void)
{
    /* Init */
    HAL_Init();
    SystemClock_Config();
    MX_GPIO_Init();
    MX_ADC_Init();
    MX_SPI1_Init();
    MX_USART1_UART_Init();

    CommInterface ci(&huart1, *fallback, *loop);

    ci.Attatch("TEST", *test);
    ci.Run();

    return 0;

}


void test(__attribute__((unused)) int argc, __attribute__((unused)) char* argv[])
{
    char s[]="Testroutine!\n";
    if(HAL_UART_Transmit(&huart1,(uint8_t*) s, strlen(s), 100) != HAL_OK)
    {
        Error_Handler();
    }

}

void fallback(__attribute__((unused)) int argc, __attribute__((unused)) char* argv[])
{
    char s[]="Command not recognized";
    if(HAL_UART_Transmit(&huart1,(uint8_t*) s, strlen(s), 100) != HAL_OK)
    {
        Error_Handler();
    }
}

void loop(__attribute__((unused)) int argc,__attribute__((unused)) char* argv[])
{

    HAL_GPIO_TogglePin(RED_LED_GPIO_Port, RED_LED_Pin);
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

void Error_Handler(void)
{
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

