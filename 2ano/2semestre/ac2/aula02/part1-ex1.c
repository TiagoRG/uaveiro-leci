#include <detpic32.h>

int main() {
    int counter = 0;
    while (1) {
        putChar('\r');
        printInt(counter, 10 | 4 << 16);
        resetCoreTimer();
        while (readCoreTimer() < 200000);
        counter++;
    }
    return 0;
}
