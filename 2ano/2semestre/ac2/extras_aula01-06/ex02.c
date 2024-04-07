#include <detpic32.h>

void delay(unsigned int ms) {
    resetCoreTimer();
    while (readCoreTimer() < ms * 20000);
}

int main() {
    TRISE &= 0xFFF0;
    LATE &= 0xFFF0;

    while (1) {
        char key = inkey();

        if ('0' <= key && key <= '3') {
            LATE = (LATE & 0xFFF0) | 0x0001 << (key - '0');
        } else if (key != '\0') {
            LATE = (LATE & 0xFFF0) | 0x000F;
            delay(1000);
            LATE &= 0xFFF0;
        }
    }

    return 0;
}
