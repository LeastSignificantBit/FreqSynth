/*
 * Atten_PE43711.cpp
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

#include "atten_pe43711.h"

Atten_PE43711::Atten_PE43711(SPI_HandleTypeDef *spih, GPIO_TypeDef* port, uint16_t pin):
    _SPIHandle(spih),
    _CsPort(port),
    _CsPin(pin)
{

}

void Atten_PE43711::SetAtt(uint8_t att)
{
    att &= 0x7F;
    /* Fast reverse of bits */
    uint8_t b = att;
    b = ((b * 0x0802LU & 0x22110LU) | (b * 0x8020LU & 0x88440LU)) * 0x10101LU >> 16;

    while (HAL_SPI_GetState(_SPIHandle) != HAL_SPI_STATE_READY) { }

    if(HAL_SPI_Transmit(_SPIHandle,&b,1,10)!= HAL_OK)
      Error_Handler();

    while (HAL_SPI_GetState(_SPIHandle) != HAL_SPI_STATE_READY) { }
    /* Latch in the current value */
    HAL_GPIO_WritePin(_CsPort, _CsPin, GPIO_PIN_SET);
    asm volatile("nop;nop;nop;");
    HAL_GPIO_WritePin(_CsPort, _CsPin, GPIO_PIN_RESET);
}
