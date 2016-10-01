/*
 * CommInterface
 * (C) Martin Berglund 2016
 * GPL v3
 */

#pragma once

#include "config/stm32plus.h"
#include "config/usart.h"
#include <vector>
#include <algorithm>

using namespace stm32plus;

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
    UsartPollingInputStream * _is;
    char _commbuf[MAX_COMM_LEN];
    std::vector<Command> _commands;
    callback_function _fallbackCallbackFun;

    size_t GetLine();
    void ParseComm();
    void ExeComm(int argc, char* argv[]);
    void StripCommStr(char* s);

public:
    CommInterface(UsartPollingInputStream *is, callback_function cf=NULL);
    void Attatch(const char* cm, callback_function cf);
    void Attatch(callback_function cf);
    void Run();
};
