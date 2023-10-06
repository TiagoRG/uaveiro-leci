#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <strings.h>

int main() {
    char string1[50], string2[50];
    printf("String 1: ");
    scanf("%s", string1);
    printf("String 2: ");
    scanf("%s", string2);

    // Count how many letters in string 1
    int count = 0;
    for (int i = 0; i<(int)(sizeof(string1)/sizeof(*string1)); i++) {
        if(isalpha(string1[i])) count++;
    }
    printf("Letters in string 1: %d\n", count);
    
    // Count how many uppercase letters in string 2
    count = 0;
    for (int i = 0; i<(int)(sizeof(string2)/sizeof(*string2)); i++) {
        if(isupper(string2[i])) count++;
    }
    printf("Uppercase in string 2: %d\n", count);
    

    // Convert both strings to lowercase
    for (int i = 0; i<(int)(sizeof(string1)/sizeof(*string1)); i++) {
        if(isupper(string1[i])) string1[i] = tolower(string1[i]);
    }
    for (int i = 0; i<(int)(sizeof(string2)/sizeof(*string2)); i++) {
        if(isupper(string2[i])) string2[i] = tolower(string2[i]);
    }
    printf("String 1 to lower: %s\nString 2 to lower: %s\n", string1, string2);
    
    if (strcmp(string1, string2) < 0) {
        printf("Strings are different\nOrdered alphabetically: %s, %s", string1, string2);
    } else if (strcmp(string1, string2) > 0) {
        printf("Strings are different\nOrdered alphabetically: %s, %s", string2, string1);
    } else {
        printf("Strings are equal");
    }
    
    // create a copy of string2 with name string3
    char string3[50];
    strcpy(string3, string2);

    // concatenate string2 and string3
    strcat(string2, string3);
    printf("\nConcatenated string2 and string3: %s", string2);

    return 0;
}
