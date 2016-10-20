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

uint32_t Powermeter_LMH2110::poll_adc()
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

int32_t Powermeter_LMH2110::GetPower_mdB()
{
    /*
     * 0V=>0x0, 3.3V=>0xFFF(4095)
     * -34dB=>0V, -11.5dB=>1V
     * out[mdB] = adc*22500*3.3/4096-34000
     *          ~ adc*18 - 34000
     */
    uint32_t value = poll_adc();

    return value*18-34000;
}
