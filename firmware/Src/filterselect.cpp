/*
 * FilterSelect.cpp
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


#include "filterselect.h"



FilterSelect::FilterSelect(GPIO_TypeDef *po1, uint16_t pi1,
                           GPIO_TypeDef *po2, uint16_t pi2,
                           GPIO_TypeDef *po3, uint16_t pi3,
                           GPIO_TypeDef *po4, uint16_t pi4)
{
    _port[0] = po1;
    _port[1] = po2;
    _port[2] = po3;
    _port[3] = po4;
    _pin[0]  = pi1;
    _pin[1]  = pi2;
    _pin[2]  = pi3;
    _pin[3]  = pi4;
}

void FilterSelect::UseFilterNo(uint8_t i)
{
    if (i<4) {
        for (int c=0;c<4;c++)
            HAL_GPIO_WritePin(_port[c],_pin[c],GPIO_PIN_RESET);
        HAL_GPIO_WritePin(_port[i],_pin[i],GPIO_PIN_SET);
    }
}
