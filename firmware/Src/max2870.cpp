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

MAX2870::MAX2870(SPI_HandleTypeDef *spih,
                 GPIO_TypeDef *csport, uint16_t cspin,
                 GPIO_TypeDef *ceport, uint16_t cepin,
                 GPIO_TypeDef *enport, uint16_t enpin,
                 GPIO_TypeDef *ldport, uint16_t ldpin):
    _SPIHandle(spih), _CsPort(csport),_CePort(ceport),_EnPort(enport),_LdPort(ldport),_CsPin(cspin),_CePin(cepin),_EnPin(enpin),_LdPin(ldpin)
{

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
    if (HAL_SPI_Transmit(_SPIHandle, (uint8_t*) &d + 3 ,4 , 10) !=HAL_OK)
        Error_Handler();

    // LE High after complete send
    while (HAL_SPI_GetState(_SPIHandle) != HAL_SPI_STATE_READY) { }
    HAL_GPIO_WritePin(_CsPort,_CsPin, GPIO_PIN_SET);

    // Receive data sending 0's
    for (int i=3; i>=0; i--)
    {
        if (HAL_SPI_TransmitReceive(_SPIHandle,  (uint8_t *)  &d + 3, (uint8_t *) &ret + i, 1, 10) != HAL_OK)
            Error_Handler();

        while (HAL_SPI_GetState(_SPIHandle) != HAL_SPI_STATE_READY) { }
    }
    //TODO: maybe shift ret>>2
    return ret;
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
