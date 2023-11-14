#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void display_pol(double* coef, size_t degree) {
    if (coef == NULL) {
        printf("NULL\n");
        return;
    }
    for (size_t i = 0; i <= degree; i++) {
        printf("%lf", coef[i]);
        if (i < degree) {
            printf(" * x^%lu + ", degree - i);
        }
    }
    printf("\n");
}

double compute_pol(double* coef, size_t degree, double x) {
    if (coef == NULL) {
        return 0;
    }
    double result = 0;
    for (size_t i = 0; i <= degree; i++) {
        result += coef[i] * pow(x, degree - i);
    }
    return result;
}

unsigned int get_real_roots(double* coef, size_t degree, double* root_1, double* root_2) {
    if (coef == NULL || root_1 == NULL || root_2 == NULL || degree != 2 || coef[0] == 0) {
        return 0;
    }
    double delta = pow(coef[1], 2) - 4 * coef[0] * coef[2];
    if (delta < 0) {
        *root_1 = 0;
        *root_2 = 0;
        return 0;
    }
    *root_1 = (-coef[1] - sqrt(delta)) / (2 * coef[0]);
    *root_2 = (-coef[1] + sqrt(delta)) / (2 * coef[0]);
    if (delta == 0) {
        return 1;
    }
    return 2;
}

int main() {
    double coef[] = {1, 2, 1};
    size_t degree = 2;
    double x = 1;
    double root_1 = 0;
    double root_2 = 0;
    printf("Polynomial: ");
    display_pol(coef, degree);
    printf("f(%lf) = %lf\n", x, compute_pol(coef, degree, x));
    printf("Number of real roots: %u\n", get_real_roots(coef, degree, &root_1, &root_2));
    printf("Roots: %lf, %lf\n", root_1, root_2);
    return 0;
}
