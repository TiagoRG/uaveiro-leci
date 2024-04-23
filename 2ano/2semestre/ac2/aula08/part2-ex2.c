#include <detpic32.h>

void _int_(8) isr_T2() {
    static int c = 0;
    if (c++ == 6) {
        IEC0bits.T2IE = 0;
        LATE &= 0xFFFE;
        c = 0;
    }
    IFS0bits.T2IF = 0;
}

void _int_(7) isr_INT1() {
    LATE |= 0x0001;
    IEC0bits.T2IE = 1;
    IFS0bits.INT1IF = 0;
}

int main() {
    TRISD |= 0x0100;
    TRISE &= 0xFFFE;
    LATE &= 0xFFFE;

    IPC1bits.INT1IP = 2;
    IEC0bits.INT1IE = 1;
    IFS0bits.INT1IF = 0;

    IPC2bits.T2IP = 2;
    IFS0bits.T2IF = 0;

    T2CONbits.TCKPS = 7;
    PR2 = 39062;
    TMR2 = 0;
    T2CONbits.TON = 1;

    EnableInterrupts();

    while (1);

    return 0;
}
