/*
 * Powermeter_LMH2110.cpp
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
