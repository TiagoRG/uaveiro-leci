#include <detpic32.h>

void delay(int ms) {
    resetCoreTimer();
    while (readCoreTimer() < ms * 20000);
}

int main() {
    // Configure RE6-RE3 as output
    TRISE &= 0xFF87;
    // Initialize the counter
    unsigned int counter = 0;
    
    while (1) {
        LATE = (LATE & 0xFF87) | counter++ << 3;
        counter %= 10;
        
        delay(460);
    }
}
