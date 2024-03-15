#include <detpic32.h>

const unsigned int dis7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D,
                                   0xFD, 0x07, 0x7F, 0x6F, 0x77, 0xFC,
                                   0x39, 0x5E, 0xF9, 0xF1};

typedef enum { HIGH, LOW } flag;

unsigned char toBdc(unsigned char value) {
    return ((value / 10) << 4) + (value % 10);
}

void send2displays(unsigned char value) {
    static flag f = LOW;
    value = toBdc(value);
    unsigned char high = dis7Scodes[value >> 4];
    unsigned char low = dis7Scodes[value & 0x0F];

    if (f == HIGH) {
        LATD = (LATD & 0xFF9F) | 0x0040;
        LATB = (LATB & 0x80FF) | high << 8;
        f = LOW;
    } else {
        LATD = (LATD & 0xFF9F) | 0x0020;
        LATB = (LATB & 0x80FF) | low << 8;
        f = HIGH;
    }
}

void delay(unsigned int ms) {
    resetCoreTimer();
    while (readCoreTimer() < ms * 20000);
}

int main() {
    TRISB = (TRISB & 0x80FF) | 0x0001;
    TRISD &= 0xFF9F;
    TRISC &= 0xBFFF;

    int counter = 0;
    int toggler = 0;

    while (1) {
        int i = 0;
        int sw0 = PORTB & 0x0001;
        do {
            send2displays(counter);
            delay(10);
            LATC &= 0xBFFF;
            if (toggler++ < 500) LATC |= 0x4000;
        } while (++i < (sw0 ? 20 : 50));
        counter += sw0 ? 1 : -1;
        if (counter < 0) {
            counter = 59;
            toggler = 0;
        }
        if (counter > 59) {
            counter = 0;
            toggler = 0;
        }
    }

    return 0;
}
