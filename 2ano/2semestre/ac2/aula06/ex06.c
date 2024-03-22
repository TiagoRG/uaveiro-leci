#include <detpic32.h>

#define SAMPLES 4

const unsigned int dis7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D,
                                   0xFD, 0x07, 0x7F, 0x6F, 0x77, 0xFC,
                                   0x39, 0x5E, 0xF9, 0xF1};

typedef enum { HIGH, LOW } flag;

unsigned char toBdc(unsigned char value) {
    return ((value / 10) << 4) + (value % 10);
}

void send2displays(unsigned char value) {
    static flag f = LOW;
    value = toBdc(value);
    unsigned char high = dis7Scodes[value >> 4];
    unsigned char low = dis7Scodes[value & 0x0F];

    if (f == HIGH) {
        LATD = (LATD & 0xFF9F) | 0x0040;
        LATB = (LATB & 0x80FF) | high << 8;
        f = LOW;
    } else {
        LATD = (LATD & 0xFF9F) | 0x0020;
        LATB = (LATB & 0x80FF) | low << 8;
        f = HIGH;
    }
}

void delay(unsigned int ms) {
    resetCoreTimer();
    while (readCoreTimer() < ms * 20000);
}

int main() {
    TRISBbits.TRISB4 = 1;                   // RB4 digital output disconnected
    AD1PCFGbits.PCFG4 = 0;                  // RB4 configured as analog input (AN4)
    AD1CON1bits.SSRC = 7;                   // Conversion trigger selection bits: in this
                                            // mode an internal counter ends sampling and
                                            // starts conversion
    AD1CON1bits.CLRASAM = 1;                // Stop conversions when the 1st A/D converter
                                            // interrupt is generated. At the same time, hardware
                                            // clears the ASAM bit
    AD1CON3bits.SAMC = 16;                  // Sample time is 16 TAD (TAD = 100 ns)
    AD1CON2bits.SMPI = SAMPLES - 1;         // Interrupt is generated after 16 samples
    AD1CHSbits.CH0SA = 4;                   // Selects AN4 as input for the A/D converter
    AD1CON1bits.ON = 1;                     // Enable A/D converter

    TRISB &= 0x80FF;                 // Configure RB8-RB14 as outputs
    TRISD &= 0xFF9F;                 // Configure RD5-RD6 as outputs

    int i = 0;
    int v = 0;

    while (1) {
        if (i == 0){ 
            AD1CON1bits.ASAM = 1;               // Start conversion
            while (IFS1bits.AD1IF == 0);        // Wait while conversion not done
            int total = 0;
            int *p = (int *)(&ADC1BUF0);
            for (; p <= (int *)(&ADC1BUFF); p+=4)
                total += *p;
            int val_ad = total / SAMPLES;
            v = (val_ad * 33 + 511) / 1023;
        }
        send2displays(v);
        delay(10);

        i = (i + 1) % 20;

        IFS1bits.AD1IF = 0;                 // Reset AD1IF
    }

    return 0;
}
