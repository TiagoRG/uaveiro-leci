#include <detpic32.h>

void setPWM(unsigned int dutyCycle) {
    if (dutyCycle < 0 || dutyCycle > 100)
        return;
    OC1RS = ((PR3 + 1) * dutyCycle) / 100;
}

int main() {
    T3CONbits.TCKPS = 2;
    PR3 = 49999;
    TMR3 = 0;
    T3CONbits.TON = 1;

    // tON = 0.25 * (1 / 100) = 2.5ms
    // fOutPreScaler = 20MHz / 4 = 5MHz
    // tOutPreScaler = 1 / 5MHz = 200ns
    // OC1RS = (2.5 * 10^-3) / (200 * 10^-9) = 12500
    OC1CONbits.OCM = 6;
    OC1CONbits.OCTSEL = 1;
    OC1RS = 12500;
    OC1CONbits.ON = 1;

    TRISC &= 0xBFFF;

    while (1) {
        setPWM(10);
        LATC = (LATC & 0xBFFF) | (PORTD & 0x0001) << 14;
    }

    return 0;
}
