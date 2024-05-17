#include <detpic32.h>

#define SAMPLES 4

volatile int voltage = 0;
volatile int voltMin = 33;
volatile int voltMax = 0;

const unsigned int dis7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D,
                                   0xFD, 0x07, 0x7F, 0x6F, 0x77, 0xFC,
                                   0x39, 0x5E, 0xF9, 0xF1};

typedef enum { HIGH, LOW } display;

unsigned char toBdc(unsigned char value) {
    return ((value / 10) << 4) + (value % 10);
}

void send2displays(unsigned char value) {
    static display flag = LOW;
    unsigned char high = dis7Scodes[value >> 4];
    unsigned char low = dis7Scodes[value & 0x0F];

    if (flag == HIGH) {
        LATD = (LATD & 0xFF9F) | 0x0040;
        LATB = (LATB & 0x80FF) | high << 8;
        flag = LOW;
    } else {
        LATD = (LATD & 0xFF9F) | 0x0020;
        LATB = (LATB & 0x80FF) | low << 8;
        flag = HIGH;
    }
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
    TRISB &= 0x80FF;
    TRISD &= 0xFF9F;

    TRISBbits.TRISB4 = 1;
    AD1PCFGbits.PCFG4 = 0;
    AD1CON1bits.SSRC = 7;
    AD1CON1bits.CLRASAM = 1;
    AD1CON3bits.SAMC = 16;
    AD1CON2bits.SMPI = SAMPLES - 1;
    AD1CHSbits.CH0SA = 4;
    AD1CON1bits.ON = 1;

    IPC6bits.AD1IP = 2;
    IFS1bits.AD1IF = 0;
    IEC1bits.AD1IE = 1;

    // Configure Timer T1 with 5Hz frequency
    T1CONbits.TCKPS = 2;
    PR1 = 62499;
    TMR1 = 0;
    T1CONbits.TON = 1;

    // Configure Timer T3 with 100Hz frequency
    T3CONbits.TCKPS = 2;
    PR3 = 49999;
    TMR3 = 0;
    T3CONbits.TON = 1;

    IPC1bits.T1IP = 2;
    IFS0bits.T1IF = 0;
    IEC0bits.T1IE = 1;

    IPC3bits.T3IP = 2;
    IFS0bits.T3IF = 0;
    IEC0bits.T3IE = 1;

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

void _int_(4) isr_T1(void) {
    AD1CON1bits.ASAM = 1;
    IFS0bits.T1IF = 0;
}

void _int_(12) isr_T3(void) {
    send2displays(toBdc(voltage));
    IFS0bits.T3IF = 0;
}

void _int_(27) isr_adc(void) {
    int *p = (int *)(&ADC1BUF0);
    int media = 0;
    for (; p <= (int *)(&ADC1BUFF); p++)
        media += *p;
    media /= SAMPLES;
    voltage = (media * 33 + 511) / 1023;
    voltMin = voltage < voltMin ? voltage : voltMin;
    voltMax = voltage > voltMax ? voltage : voltMax;
    IFS1bits.AD1IF = 0;
}

void _int_(32) isr_uart2rx() {
    // If OERR == 1 then reset OERR
    if (U2STAbits.OERR == 1)
        U2STAbits.OERR = 0;
    // Save U2RXREG value
    char c = U2RXREG;

    if (c == 'M') {
        char v = toBdc(voltMax);
        putstr("VMax=");
        putc((v >> 4) + 0x30);
        putc('.');
        putc((v & 0x0F) + 0x30);
        putc('V');
        putc('\n');
    } else if (c == 'm') {
        char v = toBdc(voltMin);
        putstr("VMin=");
        putc((v >> 4) + 0x30);
        putc('.');
        putc((v & 0x0F) + 0x30);
        putc('V');
        putc('\n');
    }

    IFS1bits.U2RXIF = 0;
}
