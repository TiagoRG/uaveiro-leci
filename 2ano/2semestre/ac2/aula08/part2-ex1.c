#include <detpic32.h>

void delay(unsigned int ms) {
    resetCoreTimer();
    while (readCoreTimer() < 20000 * ms);
}

int main() {
    TRISD |= 0x0100;
    TRISE &= 0xFFFE;
    LATE &= 0xFFFE;

    while (1) {
        while (((PORTD >> 8) & 0x0001) == 1);
        LATE ^= 0x0001;
        delay(3000);
        LATE ^= 0x0001;
    }

    return 0;
}
