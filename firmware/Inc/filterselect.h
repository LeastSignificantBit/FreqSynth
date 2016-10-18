/*
 * FilterSelect
 * (C) Martin Berglund 2016
 * GPL v3
 */

#pragma once

#include "gpio.h"

class FilterSelect
{
private:
    GPIO_TypeDef * _port[4];
    uint16_t _pin[4];
public:
    FilterSelect(GPIO_TypeDef* po1, uint16_t pi1,
                 GPIO_TypeDef* po2, uint16_t pi2,
                 GPIO_TypeDef* po3, uint16_t pi3,
                 GPIO_TypeDef* po4, uint16_t pi4);
    void UseFilterNo(int i);

};
