#include <stdio.h>

int arr_length(int arr[])
{
    int count = 0;
    for(int i=0; arr[i]!='\0'; i++) {
        count++;
    }
    return count;
}

void print_array(char s[], int arr[]) {
    printf("%s:\n", s);
    for (int i=0; i<arr_length(arr); i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

void cumSum(int a[], int b[]) {
    int c = 0;
    for (int i=0; i<arr_length(a); i++) {
        c += a[i];
        b[i] = c;
    }
}

int main() {
    int a[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    print_array("a", a);

    int b[12] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    //print_array("b", b);
    cumSum(a, b);
    print_array("b", b);
}
