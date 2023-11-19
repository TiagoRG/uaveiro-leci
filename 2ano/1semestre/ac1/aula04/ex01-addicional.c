#include <stdio.h>
#define SIZE 20

int main(void)
{
    static char str[SIZE+1];
    char *p;

    printf("Introduza uma string: ");
    scanf("%s", str);
    p = str;

    /// CONVERTER PARA MAIÚSCULAS
    while (*p != 0x00)
    {
        if (*p >= 0x61 && *p <= 0x7A)
            *p = *p + -0x20;

        p++;
    }
    ///

    printf("%s\n", str);

    p = str;

    /// CONVERTER PARA MINÚSCULAS
    while (*p != 0x00)
    {
        if (*p >= 0x41 && *p <= 0x5A)
            *p = *p + 0x20;

        p++;
    }
    ///

    printf("%s\n", str);

    return 0;
}
