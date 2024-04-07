#include <detpic32.h>

const unsigned int dis7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D,
                                   0xFD, 0x07, 0x7F, 0x6F, 0x77, 0xFC,
                                   0x39, 0x5E, 0xF9, 0xF1};

void delay(unsigned int ms) {
    resetCoreTimer();
    while (readCoreTimer() < ms * 20000);
}

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

void clearDisplays() {
    LATD = (LATD & 0xFF9F) | 0x0040;
    LATB &= 0x80FF;
    LATD = (LATD & 0xFF9F) | 0x0020;
    LATB &= 0x80FF;
}

unsigned char toBdc(unsigned char value) {
    return ((value / 10) << 4) + (value % 10);
}

int main() {
    TRISB &= 0x80FF;
    TRISD &= 0xFF9F;

    int counter = 0;
    char factor = 0;
    int display_freq = 0;
    int i = 0;

    while (1) {
        putChar('\r');
        printInt(counter, 10 | 2 << 16);
        char key = inkey();
        if ('0' <= key && key <= '4') {
            factor = key - '0';
        }
        if (key == '\n') {
            display_freq = !display_freq;
        }
        if (display_freq) {
            printStr(" -> ");
            printInt(2 * (1 + factor), 10 | 2 << 16);
            printStr(" Hz");
            send2displays(toBdc(2 * (1 + factor)));
        } else {
            printStr("         \r");
            clearDisplays();
        }
        if (i++ >= 50 / (2 * (1 + factor))) {
            counter = (counter + 1) % 100;
            i = 0;
        }
        delay(20);
        
    }

    return 0;
}
