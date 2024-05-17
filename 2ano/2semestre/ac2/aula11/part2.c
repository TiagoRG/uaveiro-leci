#include "p32mx795f512h.h"
#include <detpic32.h>

volatile struct {
    char mem[100];
    int nchar;
    int posrd;
} txbuf;

void putStrInt(char *s) {
    while (txbuf.nchar > 0);

    while (*s != '\0')
        txbuf.nchar++[txbuf.mem] = *s++;

    txbuf.posrd = 0;
    IEC1bits.U2TXIE = 1;
}

int main() {
    U2BRG = ((PBCLK + 8 * 115200) / (16 * 115200)) - 1;
    U2MODEbits.BRGH = 0;    // 16x baud clock enabled (1 -> 4x baud clock)

    U2MODEbits.PDSEL = 00;  // 8 data bits, without parity
    U2MODEbits.STSEL = 0;   // 1 stop bit

    U2STAbits.URXEN = 1;    // Enable Receiver
    U2STAbits.UTXEN = 1;    // Enable Transmitter

    IEC1bits.U2RXIE = 0;
    IEC1bits.U2TXIE = 0;
    IPC8bits.U2IP = 2;
    IFS1bits.U2TXIF = 0;
    U2STAbits.UTXISEL = 00;

    U2MODEbits.ON = 1;

    EnableInterrupts();
    txbuf.nchar = 0;

    while (1) {
        putStrInt("Test string which can be as long as you like, up to a maximum of 100 characters\n");
    }

    return 0;
}

void _int_(32) isr_uart2tx() {
    if (!IFS1bits.U2TXIF) return;
    if (txbuf.nchar-- > 0) {
        U2TXREG = txbuf.posrd++[txbuf.mem];
    } else {
        IEC1bits.U2TXIE = 0;
    }

    IFS1bits.U2TXIF = 0;
}
