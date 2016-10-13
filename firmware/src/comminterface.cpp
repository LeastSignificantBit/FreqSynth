/*
 * CommInterface - Martin Berglund 2016
 *
 */
#include "comminterface.h"

CommInterface::CommInterface(UsartPollingInputStream *is,
                             callback_function cf):
    _is(is),_fallbackCallbackFun(cf)
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
        ret = _is->read();
        if (ret == stm32plus::UsartPollingInputStream::E_END_OF_STREAM ||
                ret == stm32plus::UsartPollingInputStream::E_STREAM_ERROR)
            break;
        else
            c = ret & 0x00ff;

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
    ExeComm(argc,argv.begin());
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
    }
}
