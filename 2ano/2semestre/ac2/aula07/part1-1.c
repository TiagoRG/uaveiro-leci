#include <detpic32.h>

int main() {
    TRISBbits.TRISB4 = 1;
    AD1PCFGbits.PCFG4 = 0;
    AD1CON1bits.SSRC = 7;
    AD1CON1bits.CLRASAM = 1;
    AD1CON3bits.SAMC = 1;
    AD1CON2bits.SMPI = 0;
    AD1CHSbits.CH0SA = 4;
    AD1CON1bits.ON = 1;

    IPC6bits.AD1IP = 2;         // configure priority of A/D interrupts
    IEC1bits.AD1IE = 1;         // enable A/D interrupts
    IFS1bits.AD1IF = 0;         // clear A/D interrupt flag

    EnableInterrupts();
    AD1CON1bits.ASAM = 1;

    while (1);
}

void _int_(27) isr_adc(void) {
    printInt(ADC1BUF0, 16 | 3 << 16);
    putChar('\r');
    IFS1bits.AD1IF = 0;
    AD1CON1bits.ASAM = 1;
}
