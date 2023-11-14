#include <math.h>
#include <stdio.h>
#define to_rad(deg) ((deg)*M_PI/180)

int main() {
    FILE *output_file;

    output_file = fopen("table2.txt", "w");

    printf("%3s | %s | %s\n", "ang", "sin(ang)", "cos(ang)");
    fprintf(output_file, "%3s | %s | %s\n", "ang", "sin(ang)", "cos(ang)");

    for (int i = 0; i < 360; i+=5) {
        printf("%3d | %.5f | %.5f\n", i, sin(to_rad(i)), cos(to_rad(i)));
        fprintf(output_file, "%3d | %.5f | %.5f\n", i, sin(to_rad(i)), cos(to_rad(i)));
    }
    
    fclose(output_file);
    return 0;
}
