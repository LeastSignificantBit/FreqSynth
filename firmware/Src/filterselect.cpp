#include "filterselect.h"



FilterSelect::FilterSelect(GPIO_TypeDef *po1, uint16_t pi1,
                           GPIO_TypeDef *po2, uint16_t pi2,
                           GPIO_TypeDef *po3, uint16_t pi3,
                           GPIO_TypeDef *po4, uint16_t pi4)
{
    _port[0] = po1;
    _port[1] = po2;
    _port[2] = po3;
    _port[3] = po4;
    _pin[0]  = pi1;
    _pin[1]  = pi2;
    _pin[2]  = pi3;
    _pin[3]  = pi4;
}

void FilterSelect::UseFilterNo(int i)
{
    if (i<4 && i>=0) {
        for (int c=0;c<4;c++)
            HAL_GPIO_WritePin(_port[c],_pin[c],GPIO_PIN_RESET);
        HAL_GPIO_WritePin(_port[i],_pin[i],GPIO_PIN_SET);
    }
}
