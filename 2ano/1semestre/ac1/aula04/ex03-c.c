#include <stdio.h>
#define SIZE 4
int array[4] = {7692, 23, 5, 234};

int main(void)
{
    int soma = 0;
    int i = 0;

    while (i < SIZE) {
        soma += array[i];
        i++;
    }

    printf("%d", soma);

    return 0;
}
