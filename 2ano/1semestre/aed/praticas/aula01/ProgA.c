#include <stdio.h>

void print_array(char s[], int arr[], int arr_size) {
    printf("%s:\n", s);
    for (int i=0; i<arr_size; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

void cumSum(int a[], int b[], int arr_size) {
    int c = 0;
    for (int i=0; i<arr_size; i++) {
        c += a[i];
        b[i] = c;
    }
}

int main() {
    int a[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    print_array("a", a, sizeof(a)/sizeof(*a));
    int b[12] = {0};
    cumSum(a, b, sizeof(a)/sizeof(*a));
    print_array("b", b, sizeof(b)/sizeof(*b));
}
