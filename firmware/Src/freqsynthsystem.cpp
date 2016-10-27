/*
 * FreqSynthSystem.cpp
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

#include "freqsynthsystem.h"


//void EnableBOut(int argc, char *argv[])
//{

//}

//void EnableAOut(int argc, char *argv[])
//{

//}

void Fallback(__attribute__((unused)) int argc, __attribute__((unused)) char *argv[])
{
    printf("Command not recognized: %s(", argv[0]);
    for (int i=1; i<argc; i++)
        printf("%s%s",argv[i],i==argc-1?")\n":", ");
}

void SetPLLParam(int argc, char *argv[])
{
    uint32_t a;
    uint8_t p;
    if(argc == 3) {
        p = strtol(argv[1], NULL, 16);
        a = strtoul(argv[2], NULL, 16);
        PLLChip.SetParam(p, a);
    }
}

void GetPLLStatus(__attribute__((unused)) int argc, __attribute__((unused)) char *argv[])
{
    printf("%08X\n%08X\n%08X\n%08X\n%08X\n%08X\n%08X\n",
           PLLChip.GetReg(0),
           PLLChip.GetReg(1),
           PLLChip.GetReg(2),
           PLLChip.GetReg(3),
           PLLChip.GetReg(4),
           PLLChip.GetReg(5),
           PLLChip.GetReg(6)
           );
}

void SetPLLReg(int argc, char *argv[])
{
    uint32_t a;
    if(argc == 2) {
        a = strtoul(argv[1], NULL, 16);
        PLLChip.SetRegister((uint8_t) a &0x07 ,a);
    }
}

void ResetPLLReg(__attribute__((unused)) int argc, __attribute__((unused)) char *argv[])
{
    PLLChip.ResetReg();
}

void ReadPower(__attribute__((unused)) int argc, __attribute__((unused)) char *argv[])
{
    int32_t power = PowerMeter.GetPower_mdB();
    int32_t res = power%1000;

    printf("%d.%03d dB\n", power/1000, res<0?-res:res);
}

void AmpOn(__attribute__((unused)) int argc, __attribute__((unused)) char *argv[])
{
    HAL_GPIO_WritePin(PWDWN_GPIO_Port, PWDWN_Pin, GPIO_PIN_RESET);
}

void AmpOff(__attribute__((unused)) int argc, __attribute__((unused)) char *argv[])
{
    HAL_GPIO_WritePin(PWDWN_GPIO_Port, PWDWN_Pin, GPIO_PIN_SET);
}

void SetAttenuation(int argc, char *argv[])
{
    uint8_t a;
    if(argc == 2) {
        a = (uint8_t)strtol(argv[1], NULL, 16);
        Attenuator.SetAtt(a);
    }
}

void SetFilter(int argc, char *argv[])
{
    uint8_t a;
    if(argc == 2) {
        a = (uint8_t)strtol(argv[1], NULL, 16);
        FilterBank.UseFilterNo(a);
    }
}

void RFOn(__attribute__((unused)) int argc, __attribute__((unused)) char *argv[])
{
    PLLChip.EnableOutput();
}

void RFOff(__attribute__((unused)) int argc, __attribute__((unused)) char *argv[])
{
    PLLChip.DisableOutput();
}
