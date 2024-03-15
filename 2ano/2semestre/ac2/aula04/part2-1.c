#include <detpic32.h>

int main() {
    // Configure ports as output
    TRISB &= 0x80FF; // Use bits 14-8
    TRISD &= 0xFF9F; // Use bits 6-5

    // Select only least significative display
    LATD = (LATD & 0xFF9F) | 0x0020;

    while (1) LATB = LATB & 0x80FF | 0x0100 << (getChar() - 'a');

    return 0;
}
