/*
 * FilterSelect.h
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
