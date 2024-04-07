#include <detpic32.h>

void delay(unsigned int ms) {
    resetCoreTimer();
    while (readCoreTimer() < ms * 20000);
}

int main() {
    TRISBbits.TRISB4 = 1;
    AD1PCFGbits.PCFG4 = 0;
    AD1CON1bits.SSRC = 7;
    AD1CON1bits.CLRASAM = 1;
    AD1CON3bits.SAMC = 16;
    AD1CON2bits.SMPI = 15;
    AD1CHSbits.CH0SA = 4;
    AD1CON1bits.ON = 1;

    TRISB |= 0x000F;

    int c = 0;
    int factor = 1;
    while (1) {
        if (c++ >= 100 / factor) {
            c = 0;
            putChar('\r');
            printStr("DS=");
            char input = PORTB & 0x000F;
            int i = 0;
            for (; i < 4; i++) {
                putChar((input >> (3 - i) & 0x0001) + '0');
            }
        }
        AD1CON1bits.ASAM = 1;
        while (IFS1bits.AD1IF == 0);
        int value = ADC1BUF0;
        int total = 0;
        int *p = (int *)(&ADC1BUF0);
        for (; p <= (int *)(&ADC1BUFF); p+=4)
            total += *p;
        factor = (total / 16) / 205 + 1;
        delay(10);
    }

    return 0;
}
