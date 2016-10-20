/*
 * FreqSynthSystem.h
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
#include "stm32f0xx_hal.h"
#include "adc.h"
#include "spi.h"
#include "usart.h"
#include "gpio.h"
#include "comminterface.h"
#include "max2870.h"
#include "printf.h"

extern MAX2870 pll;

void Fallback(int argc, char* argv[]);
void SetPLLReg(int argc, char* argv[]);
void GetPLLStatus(int argc, char* argv[]);
void SetPLLParam(int argc, char* argv[]);
void EnableAOut(int argc, char* argv[]);
void EnableBOut(int argc, char* argv[]);
