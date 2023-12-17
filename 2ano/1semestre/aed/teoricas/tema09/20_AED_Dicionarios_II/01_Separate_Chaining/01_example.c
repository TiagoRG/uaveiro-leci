//
// Algoritmos e Estruturas de Dados --- 2023/2024
//
// Joaquim Madeira, May 2020, November 2023
//
// Simple Hash Table using Separate Chaining
// Key and Value are STRINGS - To simplify the example
//

#include <stdio.h>
#include <stdlib.h>

#include "HashTable.h"

int main(void) {
  // FIRST HT - Use the first key character only

  HashTable* table01 = HashTableCreate(17, hash1);

  HashTablePut(table01, "January", "1st month of the year");
  HashTablePut(table01, "February", "2nd month of the year");
  HashTablePut(table01, "March", "3rd month");
  HashTablePut(table01, "April", "4th month");
  HashTablePut(table01, "May", "5th month");
  HashTablePut(table01, "June", "6th month");
  HashTablePut(table01, "July", "7th month");
  HashTablePut(table01, "August", "8th month");
  HashTablePut(table01, "September", "9th month");
  HashTablePut(table01, "October", "10th month");
  HashTablePut(table01, "November", "11th month");
  HashTablePut(table01, "December", "12th month");
  HashTableDisplay(table01);

  HashTableReplace(table01, "December", "The last month of the year");
  HashTableReplace(table01, "February", "The second month of the year");
  HashTableReplace(table01, "November", "Almost at the end of the year");
  HashTableDisplay(table01);

  char* string = HashTableGet(table01, "December");
  printf("\n*** %s = %s ***\n\n", "December", string);
  free(string);

  // SECOND HT - Use the first and second key characters

  HashTable* table02 = HashTableCreate(17, hash2);

  HashTablePut(table02, "January", "1st month of the year");
  HashTablePut(table02, "February", "2nd month of the year");
  HashTablePut(table02, "March", "3rd month");
  HashTablePut(table02, "April", "4th month");
  HashTablePut(table02, "May", "5th month");
  HashTablePut(table02, "June", "6th month");
  HashTablePut(table02, "July", "7th month");
  HashTablePut(table02, "August", "8th month");
  HashTablePut(table02, "September", "9th month");
  HashTablePut(table02, "October", "10th month");
  HashTablePut(table02, "November", "11th month");
  HashTablePut(table02, "December", "12th month");
  HashTableDisplay(table02);

  HashTableRemove(table02, "January");
  HashTableRemove(table02, "February");
  HashTableRemove(table02, "March");
  HashTableRemove(table02, "April");
  HashTableDisplay(table02);

  HashTableRemove(table02, "May");
  HashTableRemove(table02, "June");
  HashTableRemove(table02, "July");
  HashTableRemove(table02, "August");
  HashTableDisplay(table02);

  HashTableRemove(table02, "September");
  HashTableRemove(table02, "October");
  HashTableRemove(table02, "November");
  HashTableRemove(table02, "December");
  HashTableDisplay(table02);

  // DESTROYING

  HashTableDestroy(&table01);
  HashTableDestroy(&table02);

  // return 0;
}