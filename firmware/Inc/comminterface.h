/*
 * CommInterface.h
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
#include "stm32f0xx_hal_conf.h"
#include "usart.h"
#include <vector>
#include <algorithm>
#include <stdlib.h>
#include <string.h>


typedef void (*callback_function)(int argc, char* argv[]);

struct Command
{
    const char* _CommWord;
    callback_function _CallbackFun;
};

// Used to compare strings inside command structures in find_if
struct find_com : std::unary_function<Command, bool> {
    const char* word;
    find_com(const char* word):word(word) { }
    bool operator()(Command const& m) const {
        return strcmp(m._CommWord, word)==0?true:false;
    }
};

class CommInterface
{
private:
    enum{
        MAX_COMM_LEN = 40,
    };
    UART_HandleTypeDef *_uart;
    char _commbuf[MAX_COMM_LEN];
    std::vector<Command> _commands;
    callback_function _fallbackCallbackFun;
    callback_function _loopCallbackFun;

    size_t GetLine();
    void ParseComm();
    void ExeComm(int argc, char* argv[]);
    void StripCommStr(char* s);

public:
    CommInterface(UART_HandleTypeDef *uart, callback_function cf=NULL);
    void Attatch(const char* cm, callback_function cf);
    void Attatch(callback_function cf);
    void Run();
};
