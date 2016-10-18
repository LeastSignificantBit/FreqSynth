/*
 * Atten_PE43711
 * (C) Martin Berglund 2016
 * GPL v3
 */

#pragma once
#include "spi.h"

class Atten_PE43711
{
    SPI_HandleTypeDef *_SPIHandle;
    GPIO_TypeDef *_CsPort;
    uint16_t _CsPin;
public:
    Atten_PE43711(SPI_HandleTypeDef * spih, GPIO_TypeDef *port, uint16_t pin);
    void SetAtt(uint8_t att);
};
