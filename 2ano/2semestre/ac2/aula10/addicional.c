#include <detpic32.h>

typedef enum { N, E, O } parity;
void setupUART2(int baudrate, parity parity, int stopBits) {
    U2BRG = (PBCLK + 8 * baudrate) / ((baudrate <= 115200 ? 16 : 4) * baudrate) - 1;
    U2MODEbits.BRGH = baudrate <= 115200 ? 0 : 1;

    U2MODEbits.PDSEL = parity == N ? 00 : parity == E ? 01 : 10;
    U2MODEbits.STSEL = stopBits == 1 ? 0 : 1;

    U2STAbits.URXEN = 1;
    U2STAbits.UTXEN = 1;

    U2MODEbits.ON = 1;
}

int main() {
    setupUART2(115200, N, 1);

    return 0;
}
