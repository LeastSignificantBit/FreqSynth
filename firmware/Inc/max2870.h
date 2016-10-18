/*
 * MAX3870 PLL Interface
 * (C) Martin Berglund 2016
 * GPL v3
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

