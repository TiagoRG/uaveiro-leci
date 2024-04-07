#include <detpic32.h>

int reverse_byte(int byte) {
    byte = (byte & 0xF0) >> 4 | (byte & 0x0F) << 4;
    byte = (byte & 0xCC) >> 2 | (byte & 0x33) << 2;
    byte = (byte & 0xAA) >> 1 | (byte & 0x55) << 1;
    return byte;
}

int main() {
    TRISB |= 0x000F;
    TRISE &= 0xFF00;

    while (1) {
        int sw = PORTB & 0x000F;
        int reverse = reverse_byte(sw);
        LATE = (LATE & 0xFF00) | sw | reverse;
    }
}
