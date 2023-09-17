#include <stdio.h>

int main() {
    printf("Sizeof(void *) ...... %ld\n", sizeof(void *));
    printf("Sizeof(void) ........ %ld\n", sizeof(void));
    printf("Sizeof(char) ........ %ld\n", sizeof(char));
    printf("Sizeof(short) ....... %ld\n", sizeof(short));
    printf("Sizeof(int) ......... %ld\n", sizeof(int));
    printf("Sizeof(long) ........ %ld\n", sizeof(long));
    printf("Sizeof(long long) ... %ld\n", sizeof(long long));
    printf("Sizeof(float) ....... %ld\n", sizeof(float));
    printf("Sizeof(double) ...... %ld\n", sizeof(double));
}
