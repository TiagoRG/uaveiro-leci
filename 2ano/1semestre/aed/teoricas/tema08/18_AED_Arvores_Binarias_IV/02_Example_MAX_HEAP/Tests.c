//
// Algoritmos e Estruturas de Dados --- 2023/2024
//
// Joaquim Madeira / Joao Manuel Rodrigues
//
// Creating Max Heaps of persons, with different comparator functions.
//

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "MaxHeap.h"
#include "Person.h"

// Comparators for Persons

int ComparatorByBirthday(const void* p1, const void* p2) {
  return PersonCompareByBirth((Person*)p1, (Person*)p2);
}

int ComparatorByLastFirstName(const void* p1, const void* p2) {
  return PersonCompareByLastFirstName((Person*)p1, (Person*)p2);
}

// The printer for Persons

void Printer(void* p) { PersonPrintf((Person*)p, " "); }

int main(void) {
  // An array of persons
  const int NP = 10;  // number of persons
  Person* person[NP];
  person[0] = PersonCreate("Eva", "Maia", 1977, 10, 20);
  person[1] = PersonCreate("Maria", "Silva", 2003, 12, 30);
  person[2] = PersonCreate("Paulo", "Guedes", 2003, 12, 31);
  person[3] = PersonCreate("Carlos", "Silva", 1999, 8, 31);
  person[4] = PersonCreate("Filipe", "Matos", 2001, 1, 1);
  person[5] = PersonCreate("Carla", "Oliveira", 1959, 1, 1);
  person[6] = PersonCreate("Vitor", "Maia", 1969, 2, 28);
  person[7] = PersonCreate("Olga", "Costa", 1967, 2, 29);
  person[8] = PersonCreate("Tiago", "Santos", 1996, 6, 13);
  person[9] = PersonCreate("Sara", "Santos", 2007, 3, 1);

  printf("\n--- Create a Max Heap, ordered according to person bithday ---\n");
  MaxHeap* heap_1 = MaxHeapCreate(NP, ComparatorByBirthday, Printer);

  printf("\n--- Create a Max Heap, ordered according to person name ---\n");
  MaxHeap* heap_2 = MaxHeapCreate(NP, ComparatorByLastFirstName, Printer);

  printf("\n--- Adding persons to the heaps ---\n");
  for (size_t n = 0; n < 6; n++) {
    int i = rand() % NP;
    MaxHeapInsert(heap_1, person[i]);
    MaxHeapInsert(heap_2, person[i]);
  }

  printf("\n--- Printing the heaps ---\n");
  MaxHeapView(heap_1);
  MaxHeapView(heap_2);

  printf("\n--- Listing heap contents in non-increasing birthday order ---\n");
  while (!MaxHeapIsEmpty(heap_1)) {
    Person* p = MaxHeapGetMax(heap_1);
    PersonPrintf(p, "\n");
    MaxHeapRemoveMax(heap_1);
  }

  printf("\n--- Listing heap contents in non-increasing name order ---\n");
  while (!MaxHeapIsEmpty(heap_2)) {
    Person* p = MaxHeapGetMax(heap_2);
    PersonPrintf(p, "\n");
    MaxHeapRemoveMax(heap_2);
  }

  // Free everything
  // (If you comment out any of these, valgrind should detect it!)
  for (int i = 0; i < NP; i++) {
    PersonDestroy(&(person[i]));
  }

  MaxHeapDestroy(&heap_1);
  MaxHeapDestroy(&heap_2);

  return 0;
}
