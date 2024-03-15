#include <detpic32.h>

const unsigned int dis7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D,
                                   0xFD, 0x07, 0x7F, 0x6F, 0x77, 0xFC,
                                   0x39, 0x5E, 0xF9, 0xF1};

typedef enum { HIGH, LOW } flag;

void send2displays(unsigned char value) {
    static flag f = LOW;

    if (f == HIGH) {
        LATD = (LATD & 0xFF9F) | 0x0040;
        LATB = (LATB & 0x80FF) | dis7Scodes[value >> 4] << 8;
        f = LOW;
    } else {
        LATD = (LATD & 0xFF9F) | 0x0020;
        LATB = (LATB & 0x80FF) | dis7Scodes[value & 0x0F] << 8;
        f = HIGH;
    }
}

void delay(unsigned int ms) {
    resetCoreTimer();
    while (readCoreTimer() < ms * 20000);
}

int main() {
    TRISB &= 0x80FF;
    TRISD &= 0xFF9F;

    int counter = 0;

    while (1) {
        int i = 0;
        do {
            send2displays(counter % 255);
            delay(10);
        } while (++i < 20);
        counter++;
    }

    return 0;
}
