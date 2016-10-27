/*
 * MAX2870.cpp
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

#include "max2870.h"


void MAX2870::_SendReg(uint8_t regno)
{
    if (regno>5)
        return;

    HAL_GPIO_WritePin(_CsPort,_CsPin,GPIO_PIN_RESET);

    for (int i=3; i>=0; i--) {
        while (HAL_SPI_GetState(_SPIHandle) != HAL_SPI_STATE_READY) { }
        if (HAL_SPI_Transmit(_SPIHandle, (uint8_t*)&_reg[regno] + i ,1 , 10) !=HAL_OK)
            Error_Handler();
    }

    while (HAL_SPI_GetState(_SPIHandle) != HAL_SPI_STATE_READY) { }

    HAL_GPIO_WritePin(_CsPort,_CsPin, GPIO_PIN_SET);
}

void MAX2870::_OverwriteReg(uint8_t regno, uint32_t val, uint8_t pos, uint8_t len)
{
    uint32_t mask = (((uint32_t)1 << len) - 1) << pos;
    _reg[regno] = (_reg[regno] & ~mask) | ((val << pos) & mask);
}

void MAX2870::ResetReg()
{
    _reg[0] = 0x007D0000;
    _reg[1] = 0x2000FFF9;
    _reg[2] = 0x00004042;
    _reg[3] = 0x0000000B;
    _reg[4] = 0x6180B23C;
    _reg[5] = 0x00400005;
}

uint32_t MAX2870::GetReg(uint8_t i)
{
    if (i<6)
        return _reg[i];
    else if (i==6)
        return GetStatus();
    else
        return 0;

}

MAX2870::MAX2870(SPI_HandleTypeDef *spih,
                 GPIO_TypeDef *csport, uint16_t cspin,
                 GPIO_TypeDef *ceport, uint16_t cepin,
                 GPIO_TypeDef *enport, uint16_t enpin,
                 GPIO_TypeDef *ldport, uint16_t ldpin):
    _SPIHandle(spih), _CsPort(csport),_CePort(ceport),_EnPort(enport),_LdPort(ldport),_CsPin(cspin),_CePin(cepin),_EnPin(enpin),_LdPin(ldpin)
{
    ResetReg();
}

void MAX2870::SetRegister(uint8_t reg, uint32_t val)
{
    //TODO: Check validity
    if (reg>6)
        return;

    _reg[reg]=val;
    _SendReg(reg);
}

uint32_t MAX2870::GetStatus()
{
    uint32_t ret=0;
    const uint32_t d = 0x06000000;
    // LE low
    HAL_GPIO_WritePin(_CsPort,_CsPin,GPIO_PIN_RESET);
    // Send 0's ending with 6
    while (HAL_SPI_GetState(_SPIHandle) != HAL_SPI_STATE_READY) { }
    if (HAL_SPI_Transmit(_SPIHandle, (uint8_t*) &d ,4 , 10) !=HAL_OK)
        Error_Handler();

    // LE High after complete send
    while (HAL_SPI_GetState(_SPIHandle) != HAL_SPI_STATE_READY) { }
    HAL_GPIO_WritePin(_CsPort,_CsPin, GPIO_PIN_SET);

    // Receive data sending 0's
    for (int i=3; i>=0; i--)
    {
        if (HAL_SPI_TransmitReceive(_SPIHandle,  (uint8_t *)  &d + 2, (uint8_t *) &ret + i, 1, 10) != HAL_OK)
            Error_Handler();

        while (HAL_SPI_GetState(_SPIHandle) != HAL_SPI_STATE_READY) { }
    }
    //TODO: maybe shift ret>>2
    return ret>>2;
}

void MAX2870::SetParam(uint8_t regid, uint32_t val)
{
    switch (regid) {
    case INT:
        _OverwriteReg(0, val, 31, 1);
        _SendReg(0);
        break;
    case N:
        _OverwriteReg(0, val, 15, 16);
        _SendReg(0);
        break;
    case FRAC:
        _OverwriteReg(0, val, 3, 12);
        _SendReg(0);
        break;
    case CPOC:
        _OverwriteReg(1, val, 31, 1);
        _SendReg(1);
        break;
    case CPL:
        _OverwriteReg(1, val, 29, 2);
        _SendReg(1);
        break;
    case CPT:
        _OverwriteReg(1, val, 27, 2);
        _SendReg(1);
        break;
    case P:
        _OverwriteReg(1, val, 15, 12);
        _SendReg(1);
        break;
    case M:
        _OverwriteReg(1, val, 3, 12);
        _SendReg(1);
        break;
    case LDS:
        _OverwriteReg(2, val, 31, 1);
        _SendReg(2);
        break;
    case SDN:
        _OverwriteReg(2, val, 29, 2);
        _SendReg(2);
        break;
    case MUX:
        _OverwriteReg(2, val, 26, 4);
        _OverwriteReg(5, val>>3, 18, 1);
        _SendReg(5);
        _SendReg(2);
        break;
    case DBR:
        _OverwriteReg(2, val, 25, 1);
        _SendReg(2);
        break;
    case RDIV2:
        _OverwriteReg(2, val, 24, 1);
        _SendReg(2);
        break;
    case R:
        _OverwriteReg(2, val, 14, 10);
        _SendReg(2);
        break;
    case REG4DB:
        _OverwriteReg(2, val, 13, 1);
        _SendReg(2);
        break;
    case CP:
        _OverwriteReg(2, val, 9, 4);
        _SendReg(2);
        break;
    case LDF:
        _OverwriteReg(2, val, 8, 1);
        _SendReg(2);
        break;
    case LDP:
        _OverwriteReg(2, val, 7, 1);
        _SendReg(2);
        break;
    case PDP:
        _OverwriteReg(2, val, 6, 1);
        _SendReg(2);
        break;
    case SHDN:
        _OverwriteReg(2, val, 5, 1);
        _SendReg(2);
        break;
    case TRI:
        _OverwriteReg(2, val, 4, 1);
        _SendReg(2);
        break;
    case RST:
        _OverwriteReg(2, val, 3, 1);
        _SendReg(2);
        break;
    case VCO:
        _OverwriteReg(3, val, 26, 6);
        _SendReg(3);
        break;
    case VAS_SHDN:
        _OverwriteReg(3, val, 25, 1);
        _SendReg(3);
        break;
    case RETUNE:
        _OverwriteReg(3, val, 24, 1);
        _SendReg(3);
        break;
    case CDM:
        _OverwriteReg(3, val, 15, 2);
        _SendReg(3);
        break;
    case CDIV:
        _OverwriteReg(3, val, 3, 12);
        _SendReg(3);
        break;
    case BS:
        _OverwriteReg(4, val>>8, 24, 2);
        _OverwriteReg(4, val, 12, 8);
        _SendReg(4);
        break;
    case FB:
        _OverwriteReg(4, val, 23, 1);
        _SendReg(4);
        break;
    case DIVA:
        _OverwriteReg(4, val, 20, 3);
        _SendReg(4);
        break;
    case BDIV:
        _OverwriteReg(4, val, 9, 1);
        _SendReg(4);
        break;
    case RFB_EN:
        _OverwriteReg(4, val, 8, 1);
        _SendReg(4);
        break;
    case BPWR:
        _OverwriteReg(4, val, 6, 2);
        _SendReg(4);
        break;
    case RFA_EN:
        _OverwriteReg(4, val, 5, 1);
        _SendReg(4);
        break;
    case APWR:
        _OverwriteReg(4, val, 3, 2);
        _SendReg(4);
        break;
    default:
        break;
    }
}

void MAX2870::Init()
{
    HAL_GPIO_WritePin(_CsPort,_CsPin,GPIO_PIN_RESET);
    Enable();
    DisableOutput();
    for(uint8_t a=0; a<2; a++)
    {
        HAL_Delay(20);
        for (uint8_t i=0; i<6; i++)
            _SendReg(5-i);
    }
}

void MAX2870::Enable()
{
    HAL_GPIO_WritePin(_CePort,_CePin,GPIO_PIN_SET);
}

void MAX2870::Disable()
{
    HAL_GPIO_WritePin(_CePort,_CePin,GPIO_PIN_RESET);
}

void MAX2870::EnableOutput()
{

    HAL_GPIO_WritePin(_EnPort,_EnPin,GPIO_PIN_SET);
}

void MAX2870::DisableOutput()
{
    HAL_GPIO_WritePin(_EnPort,_EnPin,GPIO_PIN_RESET);
}

bool MAX2870::IsLocked()
{
    return HAL_GPIO_ReadPin(_LdPort,_LdPin) == GPIO_PIN_SET ?true:false;
}
