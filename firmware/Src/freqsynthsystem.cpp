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

//void SetPLLParam(int argc, char *argv[])
//{

//}

void GetPLLStatus(__attribute__((unused)) int argc, __attribute__((unused)) char *argv[])
{
    printf("0x%08X\n", pll.GetStatus());
}

//void SetPLLReg(int argc, char *argv[])
//{

//}

void Fallback(__attribute__((unused)) int argc, __attribute__((unused)) char *argv[])
{
    printf("Command not recognized: %s(", argv[0]);
    for (int i=1; i<argc; i++)
        printf("%s%s",argv[i],i==argc-1?")\n":", ");
}
