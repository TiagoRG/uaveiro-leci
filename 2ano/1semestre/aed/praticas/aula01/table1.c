#include <math.h>
#include <stdio.h>

int main() {
    int lines;

    printf("Número de linhas: ");
    scanf("%d", &lines);
    
    printf("%5s | %10s | %s \n", "Number", "Square", "Square Root");
    for(int i = 1; i<=lines; i++) {
        printf("%6d | %10d | %.4f\n", i, i*i, sqrt(i));
    }

    return 0;
}
