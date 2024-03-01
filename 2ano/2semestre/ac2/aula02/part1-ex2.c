#include <detpic32.h>

void delay(unsigned int ms) {
    resetCoreTimer();
    while(readCoreTimer() < ms * 20000);
}

int main() {
    int counter = 0;
    while (1) {
        putChar('\r');
        printInt(counter++, 10 | 4 << 16);
        delay(1000);
    }
    return 0;
}
