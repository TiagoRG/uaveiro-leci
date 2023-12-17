//
// Algoritmos e Estruturas de Dados --- 2023/2024
//
// Joaquim Madeira, May 2020, November 2023
//
// Simple Hash Table using Open Addressing
// Key and Value are STRINGS - To simplify the example
//

#include <stdio.h>
#include <stdlib.h>

#include "HashTable.h"

int main(void) {
  // FIRST HT - Use the first key character only - Linear Probing
  printf(
      "\nHT 1 --- Hashing with first key character only"
      "\n     --- Linear Probing\n");

  HashTable* table01 = HashTableCreate(17, hash1, linearProbing, 0);

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

  printf("\nReplacing some table elements\n");

  HashTableReplace(table01, "December", "The last month of the year");
  HashTableReplace(table01, "February", "The second month of the year");
  HashTableReplace(table01, "November", "Almost at the end of the year");
  HashTableDisplay(table01);

  char* string = HashTableGet(table01, "December");
  printf("\n*** %s = %s ***\n\n", "December", string);
  free(string);

  // SECOND HT - Use the first key character only - Quadratic Probing
  printf(
      "\nHT 2 --- Hashing with first key character only"
      "\n     --- Quadratic Probing\n");

  HashTable* table02 = HashTableCreate(17, hash1, quadraticProbing, 0);

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

  printf("\nReplacing some table elements\n");

  HashTableReplace(table02, "December", "The last month of the year");
  HashTableReplace(table02, "February", "The second month of the year");
  HashTableReplace(table02, "November", "Almost at the end of the year");
  HashTableDisplay(table02);

  string = HashTableGet(table02, "December");
  printf("\n*** %s = %s ***\n\n", "December", string);
  free(string);

  // THIRD HT - Use the first and second key characters - Linear Probing
  printf(
      "\nHT 3 --- Hashing with first and second key characters"
      "\n     --- Linear Probing"
      "\n     --- Resizing allowed\n");

  HashTable* table03 = HashTableCreate(17, hash2, linearProbing, 1);

  HashTablePut(table03, "January", "1st month of the year");
  HashTablePut(table03, "February", "2nd month of the year");
  HashTablePut(table03, "March", "3rd month");
  HashTablePut(table03, "April", "4th month");
  HashTablePut(table03, "May", "5th month");
  HashTablePut(table03, "June", "6th month");
  HashTablePut(table03, "July", "7th month");
  HashTablePut(table03, "August", "8th month");
  HashTablePut(table03, "September", "9th month");
  HashTablePut(table03, "October", "10th month");
  HashTablePut(table03, "November", "11th month");
  HashTablePut(table03, "December", "12th month");
  HashTableDisplay(table03);

  HashTableRemove(table03, "January");
  HashTableRemove(table03, "February");
  HashTableRemove(table03, "March");
  HashTableRemove(table03, "April");
  HashTableDisplay(table03);

  HashTableRemove(table03, "May");
  HashTableRemove(table03, "June");
  HashTableRemove(table03, "July");
  HashTableRemove(table03, "August");
  HashTableDisplay(table03);

  HashTableRemove(table03, "September");
  HashTableRemove(table03, "October");
  HashTableRemove(table03, "November");
  HashTableRemove(table03, "December");
  HashTableDisplay(table03);

  // 4TH HT - Use the first and second key characters - Quadratic Probing
  printf(
      "\nHT 4 --- Hashing with first and second key characters"
      "\n     --- Quadratic Probing"
      "\n     --- Resizing allowed\n");

  HashTable* table04 = HashTableCreate(17, hash2, quadraticProbing, 1);

  HashTablePut(table04, "January", "1st month of the year");
  HashTablePut(table04, "February", "2nd month of the year");
  HashTablePut(table04, "March", "3rd month");
  HashTablePut(table04, "April", "4th month");
  HashTablePut(table04, "May", "5th month");
  HashTablePut(table04, "June", "6th month");
  HashTablePut(table04, "July", "7th month");
  HashTablePut(table04, "August", "8th month");
  HashTablePut(table04, "September", "9th month");
  HashTablePut(table04, "October", "10th month");
  HashTablePut(table04, "November", "11th month");
  HashTablePut(table04, "December", "12th month");
  HashTableDisplay(table04);

  // DESTROYING

  HashTableDestroy(&table01);
  HashTableDestroy(&table02);
  HashTableDestroy(&table03);
  HashTableDestroy(&table04);

  return 0;
}