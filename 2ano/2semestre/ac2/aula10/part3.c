#include <detpic32.h>

void putc(char c) {
    while (U2STAbits.UTXBF);
    U2TXREG = c;
}

void putStr(char *c) {
    while (*c != '\0') putc(*c++);
}

int main() {
    TRISDbits.TRISD11 = 0;

    U2BRG = (PBCLK + 8 * 115200) / (16 * 115200) - 1;
    U2MODEbits.BRGH = 0;

    U2MODEbits.PDSEL = 00;
    U2MODEbits.STSEL = 0;

    U2STAbits.URXEN = 1;
    U2STAbits.UTXEN = 1;

    U2MODEbits.ON = 1;

    while (1) {
        while (!U2STAbits.TRMT);
        LATDbits.LATD11 = 1;
        putStr("12345");
        LATDbits.LATD11 = 0;
    }

    return 0;
}
