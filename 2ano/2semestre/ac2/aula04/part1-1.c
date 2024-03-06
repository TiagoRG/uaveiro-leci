#include <detpic32.h>

void delay(int ms) {
    resetCoreTimer();
    while (readCoreTimer() < ms * 20000);
}

int main() {
    // Configure RB14 as output
    TRISCbits.TRISC14 = 0;

    while (1) {
        // Wait 0.5s
        delay(500);
        // Update value
        LATCbits.LATC14 = !LATCbits.LATC14;

        // Print current value
        printStr("RB14: ");
        printInt10(LATCbits.LATC14);
        putChar('\r');
    }
}
