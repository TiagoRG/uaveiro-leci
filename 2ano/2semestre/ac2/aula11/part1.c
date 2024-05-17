#include <detpic32.h>

int main() {
    TRISCbits.TRISC14 = 0;

    U2BRG = ((PBCLK + 8 * 115200) / (16 * 115200)) - 1;
    U2MODEbits.BRGH = 0;    // 16x baud clock enabled (1 -> 4x baud clock)

    U2MODEbits.PDSEL = 00;  // 8 data bits, without parity
    U2MODEbits.STSEL = 0;   // 1 stop bit

    U2STAbits.URXEN = 1;    // Enable Receiver
    U2STAbits.UTXEN = 1;    // Enable Transmitter

    IEC1bits.U2RXIE = 1;
    IEC1bits.U2TXIE = 0;
    IPC8bits.U2IP = 2;
    IFS1bits.U2RXIF = 0;

    U2MODEbits.ON = 1;

    EnableInterrupts();

    while (1);
    return 0;
}

void putc(char byte) {
    // wait while UTXBF == 1
    while (U2STAbits.UTXBF == 1);
    // Copy byte to the UxTXREG register
    U2TXREG = byte;
}

void _int_(32) isr_uart2rx() {
    // If OERR == 1 then reset OERR
    if (U2STAbits.OERR == 1)
        U2STAbits.OERR = 0;
    // Wait while URXDA == 0
    while (U2STAbits.URXDA == 0);
    // Save U2RXREG value
    char c = U2RXREG;

    if (c == 'T') LATCbits.LATC14 = 1;
    else if (c == 't') LATCbits.LATC14 = 0;

    putc(c);

    IFS1bits.U2RXIF = 0;
}
