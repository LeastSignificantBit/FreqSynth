#include "comminterface.h"

TextOutputStream* out;

void test(int argc, char* argv[])
{
    out->flush();
    *out<<"I got";
    for (int i=0; i<argc; i++)
        *out<<":"<<argv[i];
    *out<<"\n";

}

void fallback(__attribute__((unused)) int argc, char* argv[])
{
    *out<<"Command not recognized: "<<argv[0]<<"\n";
}

int main()
{
    Usart2<> usart(57600);
    UsartPollingOutputStream outputStream(usart);
    UsartPollingInputStream inputStream(usart);

    out = new TextOutputStream(outputStream);
    CommInterface ci(&inputStream, *fallback);

    ci.Attatch("TEST", *test);
    ci.Run();

    // not reached
    return 0;
}
