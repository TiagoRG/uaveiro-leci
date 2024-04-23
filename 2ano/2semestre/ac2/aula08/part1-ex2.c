#include <detpic32.h>

void _int_(12) isr_T3(void) {
    putChar('.');
    IFS0bits.T3IF = 0;              // Reset timer T3 interrupt flag
}

int main() {
    T3CONbits.TCKPS = 7;            // 1:256 prescaler
    PR3 = 39062;                    // Fout = 20MHz / (256 * (39062 + 1)) = 2Hz
    TMR3 = 0;                       // Reset timer T3 count register
    T3CONbits.TON = 1;              // Enable timer T3 (must be the last command of the timer configuration sequence)

    IPC3bits.T3IP = 2;              // Interrupt priority (must be in range [1..6])
    IEC0bits.T3IE = 1;              // Enable timer T3 interrupts
    IFS0bits.T3IF = 0;              // Reset timer T3 interrupt flag

    EnableInterrupts();             // Global Interrupt Enable
    while (1);

    return 0;
}
