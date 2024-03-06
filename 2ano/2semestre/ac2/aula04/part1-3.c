#include <detpic32.h>

void delay(int ms) {
    resetCoreTimer();
    while (readCoreTimer() < ms * 20000);
}

int main() {
    // Configure RE6-RE3 as output
    TRISE = TRISE & 0xFF87;
    // Initialize the counter
    unsigned int counter = 0;
    
    while (1) {
        // Update value
        LATE = (LATE & 0xFF87) // Reset bits 6-3
               | counter << 3; // Merge with counter
        
        delay(370);
        counter = (counter + 9) % 10;
    }
}
