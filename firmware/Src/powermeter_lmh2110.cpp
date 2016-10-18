/*
 * Powermeter_LMH2110
 * (C) Martin Berglund 2016
 * GPL v3
 */

#include "powermeter_lmh2110.h"

uint16_t Powermeter_LMH2110::poll_adc()
{
    if (HAL_ADC_Start(_AdcHandle) != HAL_OK)
    {
        Error_Handler();
    }

    if (HAL_ADC_PollForConversion(_AdcHandle, 10) != HAL_OK)
    {
        Error_Handler();
    } else {
        return HAL_ADC_GetValue(_AdcHandle);
    }
    return -1;
}

Powermeter_LMH2110::Powermeter_LMH2110(ADC_HandleTypeDef *adchandle):
    _AdcHandle(adchandle)
{

}

uint16_t Powermeter_LMH2110::GetPower_mdB()
{
    uint16_t value = poll_adc();

    /* TODO: add conversion */

    return value;
}
