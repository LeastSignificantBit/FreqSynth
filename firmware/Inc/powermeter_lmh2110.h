/*
 * Powermeter_LMH2110
 * (C) Martin Berglund 2016
 * GPL v3
 */

#pragma once

#include "adc.h"


class Powermeter_LMH2110
{
    uint16_t poll_adc();
    ADC_HandleTypeDef* _AdcHandle;
public:
    Powermeter_LMH2110(ADC_HandleTypeDef *adchandle);
    uint16_t GetPower_mdB();
};
