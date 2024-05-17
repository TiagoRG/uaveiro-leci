#include <detpic32.h>

void delay(unsigned int ms) {
    resetCoreTimer();
    while (readCoreTimer() < ms * 20000);
}

void putc(char byte) {
    // wait while UTXBF == 1
    while (U2STAbits.UTXBF == 1);
    // Copy byte to the UxTXREG register
    U2TXREG = byte;
}

void putstr(char *str) {
    // use putc() function to send each charater ('\0' should not be sent)
    while (*str != '\0') putc(*str++);
}

int main() {
    // Configure UART2:
    // 1 - Configure BaudRate Generator
    U2BRG = ((PBCLK + 8 * 115200) / (16 * 115200)) - 1;
    U2MODEbits.BRGH = 0;    // 16x baud clock enabled (1 -> 4x baud clock)

    // 2 - Configure number of data bits, parity and number of stop bits
    // (see U2MODE register)
    U2MODEbits.PDSEL = 00;  // 8 data bits, without parity
    U2MODEbits.STSEL = 0;   // 1 stop bit

    // 3 - Enable the transmitter and receiver modules (see register U2STA)
    U2STAbits.URXEN = 1;    // Enable Receiver
    U2STAbits.UTXEN = 1;    // Enable Transmitter

    // 4 - Enable UART2 (see register U2MODE)
    U2MODEbits.ON = 1;

    int i, count = 0;

    while(1) {
        // Incrementa o contador módulo 10
        count = (count + 1) % 10;

        // Converte o valor do contador para binário
        char binary[5];
        for (i = 0; i < 4; i++) {
            binary[3 - i] = (count & (1 << i)) ? '1' : '0';
        }
        binary[4] = '\0';

        // Count modulo 10 em binário:
        putstr(binary);
        putc('\n');

        delay(200);  // 5hz = 200ms
    }
    return 0;
}

