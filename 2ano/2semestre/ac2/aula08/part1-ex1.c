#include <detpic32.h>

int main() {
    T3CONbits.TCKPS = 7;            // 1:256 prescaler
    PR3 = 39062;                    // Fout = 20MHz / (256 * (39062 + 1)) = 2Hz
    TMR3 = 0;                       // Reset timer T3 count register
    T3CONbits.TON = 1;              // Enable timer T3 (must be the last command of the timer configuration sequence)

    while (1) {
        while (IFS0bits.T3IF == 0); // Wait while T3IF is 0
        IFS0bits.T3IF = 0;          // Reset T3IF
        putChar('.');
    }

    return 0;
}
