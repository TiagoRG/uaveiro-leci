#include <detpic32.h>

void delay(unsigned int ms) {
    resetCoreTimer();
    while(readCoreTimer() < ms * 20000);
}

int main() {
    int cnt1 = 0, cnt5 = 0, cnt10 = 0;
    unsigned int ms = 100;
    while (1) {
        putChar('\r');
        printInt(cnt1, 10 | 4 << 16);
        putChar('\t');
        printInt(cnt5, 10 | 4 << 16);
        putChar('\t');
        printInt(cnt10, 10 | 4 << 16);

        char key = inkey();
        switch(key) {
            case 'S':
                while(inkey() != 'R');
                break;
            case 'A':
                ms /= 2;
                break;
            case 'N':
                ms = 100;
                break;
        }

        delay(ms);
        if (cnt10 % 10 == 0) cnt1++;
        if (cnt10 % 2 == 0) cnt5++;
        cnt10++;
    }
    return 0;
}
