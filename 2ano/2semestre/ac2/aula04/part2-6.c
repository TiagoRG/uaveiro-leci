#include <detpic32.h>

const unsigned int dis7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D,
                                   0xFD, 0x07, 0x7F, 0x6F, 0x77, 0xFC,
                                   0x39, 0x5E, 0xF9, 0xF1};

void delay(unsigned int ms) {
    resetCoreTimer();
    while (readCoreTimer() < 20000 * ms);
}

int main() {
    TRISB &= 0x80FF;
    TRISB |= 0x000F;
    TRISD &= 0xFF9F;

    LATD = (LATD & 0xFF9F) | 0x0040;

    while (1) {
        char c = PORTB & 0x000F;
        LATB = (LATB & 0x80FF) | dis7Scodes[c] << 8;
    }

    return 0;
}
