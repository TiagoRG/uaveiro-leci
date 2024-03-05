#include <detpic32.h>

#define SIZE 20

char *strcat(char *, char *);
char *strcpy(char *, char *);
int strlen(char *);
int strcmp(char *str1, char *str2);

int main(void) {
    static char str1[SIZE + 1];
    static char str2[SIZE + 1];
    static char str3[2 * SIZE + 1];

    printStr("Introduza 2 strings:\n");
    readStr(str1, SIZE);
    putChar('\n');
    readStr(str2, SIZE);
    putChar('\n');
    printStr("Resultados:\n");
    printStr("Str1 len: ");
    printInt(strlen(str1), 10);
    putChar('\n');
    printStr("Str2 len: ");
    printInt(strlen(str2), 10);
    putChar('\n');
    strcpy(str3, str1);
    printStr("Str3 + Str2: ");
    printStr(strcat(str3, str2));
    putChar('\n');
    printStr("Str1 == Str2: ");
    printInt10(strcmp(str1, str2));
    putChar('\n');
    return 0;
}
// Returns the length of string "str" (excluding the null character)
int strlen(char *str) {
    int len;
    for (len = 0; *str != '\0'; len++, str++);
    return len;
}
// Copy the string pointed by "src" (including the null character) to
// destination (pointed by "dst")
char *strcpy(char *dst, char *src) {
    char *p = dst;
    for (; (*dst = *src) != '\0'; dst++, src++);
    return p;
}
// Concatenates "dst" and "src" strings
// The result is stored in the "dst" string
char *strcat(char *dst, char *src) {
    char *p = dst;
    for (; *dst != '\0'; dst++);
    strcpy(dst, src);
    return p;
}

// Compares two strings, character by character
// Returned value is:
// < 0 string "str1" is "less than" string "str2" (first
//      non-matching character in str1 is lower, in ASCII, than that of str2)
// = 0 string "str1" is equal to string "str2"
// > 0 string "str1" is "greater than" string "str2" (first
//      non-matching character in str1 is greater, in ASCII, than that of str2)
int strcmp(char *str1, char *str2) {
    for (; (*str1 == *str2) && (*str1 != '\0'); str1++, str2++);
    return (*str1 - *str2);
}
