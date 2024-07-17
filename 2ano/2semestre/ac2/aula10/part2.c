#include <detpic32.h>

void putc(char byte) {
    // wait while UTXBF == 1
    while (U1STAbits.UTXBF == 1);
    // Copy byte to the UxTXREG register
    U1TXREG = byte;
}

int main() {
    U1BRG = ((PBCLK + 8 * 115200) / (16 * 115200)) - 1;
    U1MODEbits.BRGH = 0;

    U1MODEbits.PDSEL = 01;
    U1MODEbits.PDSEL = 0;

    U1STAbits.UTXEN = 1;
    U1STAbits.URXEN = 0;

    U1MODEbits.ON = 1;

    while (1) {
        putc(0x5A);
        resetCoreTimer();
        while (readCoreTimer() < 200000);
    }

    return 0;
}

