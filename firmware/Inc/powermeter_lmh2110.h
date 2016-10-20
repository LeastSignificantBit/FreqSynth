/*
 * Powermeter_LMH2110.h
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


#pragma once

#include "adc.h"


class Powermeter_LMH2110
{
    uint32_t poll_adc();
    ADC_HandleTypeDef* _AdcHandle;
public:
    Powermeter_LMH2110(ADC_HandleTypeDef *adchandle);
    int32_t GetPower_mdB();
};
