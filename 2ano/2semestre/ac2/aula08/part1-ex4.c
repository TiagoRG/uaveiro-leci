#include <detpic32.h>

int counters[] = {0, 0};

void print() {
    putChar('\r');
    printStr("T1: ");
    printInt10(0[counters]);
    printStr(" T3: ");
    printInt10(1[counters]);
}

void _int_(4) isr_T1(void) {
    counters[0]++;
    LATD ^= 0x0001;
    LATE ^= 0x0002;
    print();
    IFS0bits.T1IF = 0;              // Reset timer T1 interrupt flag
}

void _int_(12) isr_T3(void) {
    counters[1]++;
    LATD ^= 0x0004;
    LATE ^= 0x0008;
    print();
    IFS0bits.T3IF = 0;              // Reset timer T3 interrupt flag
}

int main() {
    T1CONbits.TCKPS = 2;
    PR1 = 62499;
    TMR1 = 0;
    T1CONbits.TON = 1;

    T3CONbits.TCKPS = 4;
    PR3 = 49999;
    TMR3 = 0;
    T3CONbits.TON = 1;

    IPC1bits.T1IP = 2;              // Interrupt priority (must be in range [1..6])
    IEC0bits.T1IE = 1;              // Enable timer T1 interrupts
    IFS0bits.T1IF = 0;              // Reset timer T1 interrupt flag

    IPC3bits.T3IP = 2;              // Interrupt priority (must be in range [1..6])
    IEC0bits.T3IE = 1;              // Enable timer T3 interrupts
    IFS0bits.T3IF = 0;              // Reset timer T3 interrupt flag

    TRISD &= 0xFFFA;
    LATD &= 0xFFFA;
    TRISE &= 0xFFF5;
    LATE &= 0xFFF5;

    EnableInterrupts();             // Global Interrupt Enable
    while (1);

    return 0;
}
