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
#include "powermeter_lmh2110.h"
#include "filterselect.h"
#include "atten_pe43711.h"
#include "printf.h"

extern MAX2870 PLLChip;
extern Powermeter_LMH2110 PowerMeter;
extern FilterSelect FilterBank;
extern Atten_PE43711 Attenuator;

void Fallback(int argc, char* argv[]);
void SetPLLReg(int argc, char* argv[]);
void GetPLLStatus(int argc, char* argv[]);
void SetPLLParam(int argc, char* argv[]);
void EnableAOut(int argc, char* argv[]);
void EnableBOut(int argc, char* argv[]);
void ResetPLLReg(int argc, char* argv[]);
void ReadPower(int argc, char* argv[]);
void AmpOn(int argc, char* argv[]);
void AmpOff(int argc, char* argv[]);
void SetAttenuation(int argc, char* argv[]);
void SetFilter(int argc, char* argv[]);
void RFOn(int argc, char* argv[]);
void RFOff(int argc, char* argv[]);

void OkComm();
void FailComm();
