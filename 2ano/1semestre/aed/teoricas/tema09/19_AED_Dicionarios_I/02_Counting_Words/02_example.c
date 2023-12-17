//
// Algoritmos e Estruturas de Dados --- 2023/2024
//
// Joaquim Madeira, May 2020, November 2023
//
// Simple exmaple for COUNTING WORDS using Open Addressing
// Keys are STRINGS - Values are INTEGERS
// Adapted from TOS - AED - 2015
//

#include <stdio.h>
#include <stdlib.h>

#include "HashTable.h"

void registerWords(HashTable* hashT, FILE* file) {
  //
  // scan the entire file
  //
  // token processing SHOULD BE improved !!!!!
  //

  char line[10000];
  char word[64];
  int i;
  int j;

  while (fgets(line, sizeof(line), file) != NULL) {
    // replace non-digits and non-letters by a space
    for (i = 0; line[i] != '\0'; i++)
      if ((line[i] < '0' || line[i] > '9') &&
          (line[i] < 'A' || line[i] > 'Z') &&
          (line[i] < 'a' || line[i] > 'z') && line[i] != '\'')
        line[i] = ' ';
    // go over the line and extract each word
    for (i = 0; line[i] != '\0'; i += j)
      if (line[i] == ' ')
        j = 1;
      else {
        for (j = 0; line[i + j] != '\0' && line[i + j] != ' '; j++)
          if (j < 63) word[j] = line[i + j];
        word[(j < 63) ? j : 63] = '\0';

        HashTableIncrement(hashT, word);
      }
  }
}

int main(int argc, char** argv) {
  if (argc == 1) {
    printf("program_name file_name\n");
    return 0;
  }

  FILE* file = fopen(argv[1], "r");
  if (file == NULL) {
    fprintf(stderr, "Unable to open file %s\n", argv[1]);
    exit(1);
  }

  // HT - Use the first two key characters only - Linear Probing - Resizing

  HashTable* countsTable = HashTableCreate(50021, hash2, linearProbing, 1);

  registerWords(countsTable, file);

  HashTableDisplayItems(countsTable);

  // Closing the file
  fclose(file);

  // DESTROYING

  HashTableDestroy(&countsTable);

  return 0;
}