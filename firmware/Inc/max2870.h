/*
 * MAX3870.h
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

#include "spi.h"
#include "gpio.h"

class MAX2870
{
    uint32_t _reg[6] ={
        0x007D0000,
        0x2000FFF9,
        0x00004042,
        0x0000000B,
        0x6180B23C,
        0x00400005};
    SPI_HandleTypeDef *_SPIHandle;
    GPIO_TypeDef *_CsPort,*_CePort,*_EnPort,*_LdPort;
    uint16_t _CsPin,_CePin,_EnPin,_LdPin;

    void _SendReg(uint8_t regno);
public:
    MAX2870(SPI_HandleTypeDef * spih,
            GPIO_TypeDef *csport, uint16_t cspin,
            GPIO_TypeDef *ceport, uint16_t cepin,
            GPIO_TypeDef *enport, uint16_t enpin,
            GPIO_TypeDef *ldport, uint16_t ldpin);
    void SetRegister(uint8_t reg, uint32_t val);
    uint32_t GetStatus();
    void Init();
    void Enable();
    void Disable();
    void EnableOutput();
    void DisableOutput();
    bool IsLocked();
};

