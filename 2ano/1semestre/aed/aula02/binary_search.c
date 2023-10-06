//
// Tomás Oliveira e Silva, AED, October 2021
//
// This program contains a flawed binary search implementation.
// Use the gdb program to execute the binary_search() function
// one line at a line and to examine the value of all relevant
// variables to find where it goes wrong. (Do not put calls to
// the printf function to discover what is wrong. In the context
// of the present exercise that would be cheating.)
//
#include <stdio.h>

int binary_search(int *a,int n,int d) {
    int lo = 0;
    int hi = n - 1;
    while(hi >= lo) {
        int middle = lo + (hi - lo) / 2;

        if(a[middle] == d)
            return middle; // found it

        if(a[middle] < d)
            lo = middle + 1;
        else
            hi = middle - 1;
    }
    return -1; // not found
}

int main(void) {
    int a[8] = { 1,3,8,11,18,19,23,27 };
    int i,d;

    for(d = 0;d <= 30;d++) {
        i = binary_search(a,8,d);
        if(i < 0)
            printf("%d not found\n",d);
        else
            printf("the index of %d is %d\n",d,i);
    }
    return 0;
}
