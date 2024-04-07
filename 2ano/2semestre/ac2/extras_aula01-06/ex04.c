#include <detpic32.h>

const unsigned int dis7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D,
                                   0xFD, 0x07, 0x7F, 0x6F, 0x77, 0xFC,
                                   0x39, 0x5E, 0xF9, 0xF1};


void delay(unsigned int ms) {
    resetCoreTimer();
    while (readCoreTimer() < ms * 20000);
}

typedef enum { HIGH, LOW } flag;

void clearDisplays() {
    LATD = (LATD & 0xFF9F) | 0x0040;
    LATB &= 0x80FF;
    LATD = (LATD & 0xFF9F) | 0x0020;
    LATB &= 0x80FF;
}

void send2displays(unsigned char value) {
    static flag f = LOW;
    char high = dis7Scodes[value >> 4];
    char low = dis7Scodes[value & 0x0F];

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

int main() {
    TRISE &= 0xFFF0;
    TRISD &= 0xFF9F;
    TRISB &= 0x80FF;
    LATE &= 0xFFF0;
    clearDisplays();

    char lastKey;
    while (1) {
        char key = inkey();

        if ('0' <= key && key <= '3') {
            LATE = (LATE & 0xFFF0) | 0x0001 << (key - '0');
            lastKey = key;
        } else if (key != '\0') {
            LATE = (LATE & 0xFFF0) | 0x000F;
            resetCoreTimer();
            while (readCoreTimer() < 20000000)
                send2displays(0xFF);
            LATE &= 0xFFF0;
            clearDisplays();
            lastKey = 0xFF;
        }

        if ('0' <= lastKey && lastKey <= '3') {
            send2displays(lastKey - '0');
            delay(10);
        }
    }

    return 0;
}
