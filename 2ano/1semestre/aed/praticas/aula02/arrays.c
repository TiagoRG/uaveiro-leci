#include <stdio.h>
#include <stdlib.h>

void display_array(double* a, size_t n) {
    printf("[");
    for (size_t i = 0; i < n; i++) {
        printf("%f", a[i]);
        if (i < n - 1) {
            printf(", ");
        }
    }
    printf("]\n");
}

double* read_array(size_t n) {
    double* a = malloc(n * sizeof(double));
    for (size_t i = 0; i < n; i++) {
        scanf("%lf", &a[i]);
    }
    return a;
}

double* append_arrays(double* a, size_t n, double* b, size_t m) {
    double* c = malloc((n + m) * sizeof(double));
    for (size_t i = 0; i < n; i++) {
        c[i] = a[i];
    }
    for (size_t i = 0; i < m; i++) {
        c[n + i] = b[i];
    }
    return c;
}


int main() {
    size_t n, m;
    printf("A size: ");
    scanf("%zu", &n);
    printf("A elements:\n");
    double* a = read_array(n);
    printf("B size: ");
    scanf("%zu", &m);
    printf("B elements:\n");
    double* b = read_array(m);
    printf("A = ");
    display_array(a, n);
    printf("B = ");
    display_array(b, m);
    double* c = append_arrays(a, n, b, m);
    printf("C = ");
    display_array(c, n + m);
    free(a);
    free(b);
    free(c);
    return 0;
}
