/*
 * CommInterface.cpp
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

#include "comminterface.h"

CommInterface::CommInterface(UART_HandleTypeDef *uart,
                             callback_function cf, callback_function lf):
    _uart(uart),
    _fallbackCallbackFun(cf),
    _loopCallbackFun(lf)
{
}

/*
 * Reads a command line from the USART, ignoring garbage like white spaces
 * and unused characters.
 * Allowed chars: a-z,A-Z,0-9,?,. and -
 * arguments are separated with ":" and the line is terminated with ";"
 */
size_t CommInterface::GetLine()
{
    char c;
    int16_t ret;
    size_t n = 0;

    while( n < MAX_COMM_LEN-1 ){
        ret = HAL_UART_Receive(_uart,(uint8_t*) &c, 1, 100);
        if (ret == HAL_ERROR)
            break;

        if (('A'<=c && c<='Z') ||('a'<=c && c<='z')  || c==':' ||
                c=='.' || ('0'<=c&& c<='9') ||c=='?' )
            _commbuf[n++] = c;
        else if (c ==';') {
            _commbuf[n++] = 0;
            break;
        }
    }
    if( n >= MAX_COMM_LEN-1 ){
        n = MAX_COMM_LEN-1;
        _commbuf[n]=0;
    }
    return n;
}

/*
 * Parsing the latest line into word chunks sent as arguments to
 * ExeComm
 */
void CommInterface::ParseComm()
{
    int argc=0;
    std::vector<char*> argv;
    char* bufend = _commbuf + strlen(_commbuf);
    char* cur = _commbuf;

    argv.push_back(cur);
    while(cur<bufend){
        cur = std::find(cur, bufend, ':');
        argc++;
        *cur++ = 0;
        argv.push_back(cur);
    }
    argv.pop_back();
    argv.push_back(0);
    StripCommStr(argv[0]);
    ExeComm(argc, &argv[0]);
}

/*
 * Finds if the command has any functions attached and
 * calls said function.
 * Otherwise - if it exists - the fall-back function is called.
 */
void CommInterface::ExeComm(int argc, char* argv[])
{
    std::vector<Command>::iterator it;
    it = std::find_if(_commands.begin(), _commands.end(),
                      find_com(argv[0]));
    if (it != _commands.end())
        it->_CallbackFun(argc, argv);
    else if (_fallbackCallbackFun!=NULL)
        _fallbackCallbackFun(argc, argv);
}

/*
 * Attach a function to a command
 */
void CommInterface::Attatch(const char* cm, callback_function cf)
{
    Command* c;
    c = new Command;
    c->_CallbackFun = cf;
    c->_CommWord = cm;
    _commands.push_back(*c);
}

/*
 * This function attaches a fall-back function to be run every time
 * a command is received that is not attached yet
 */
void CommInterface::Attatch(callback_function cf)
{
    _fallbackCallbackFun = cf;
}

/*
 * This function strips down the command string to its core,
 * removing lower case letters and numbers.
 */
void CommInterface::StripCommStr(char* s)
{
    size_t i=0,c=0;
    while (s[i]){
        if (('A'<=s[i] && 'Z'>=s[i]) || s[i]=='?')
            s[c++]=s[i];
        i++;
    }
    s[c]=0;
}

/*
 *  The loop
 */
void CommInterface::Run()
{
    for (;;){
        GetLine();
        ParseComm();
        if(_loopCallbackFun)
            _loopCallbackFun(0, NULL);
    }
}
