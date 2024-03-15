#include <detpic32.h>

void delay(unsigned int ms) {
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}

int main() {
    // Configure ports as output
    TRISB &= 0x80FF; // Use bits 14-8
    TRISD &= 0xFF9F; // Use bits 6-5

    // Select least significative display
    LATD = (LATD & 0xFF9F) | 0x0020;

    while (1) {
        unsigned char segment = 1;
        for (; segment < (1<<7); segment <<= 1) {
            LATB = (LATB & 0x80FF) | segment << 8;
            delay(500);
        }
        LATD ^= 0x0060;
    }

    return 0;
}
