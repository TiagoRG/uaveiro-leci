
///
// Joaquim Madeira, April 2020
//
// TESTING the TAD SORTED LIST implementation
//

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "Date.h"
#include "SortedList.h"

// Storing pointers to integers

// The comparator

int comparatorForDates(const void* p1, const void* p2) {
  return DateCompare((Date*)p1, (Date*)p2);
}

int main(void) {
  List* list = ListCreate(comparatorForDates);

  printf("INSERTING\n");

  for (int i = 2; i < 13; i += 2) {
    Date* aux = DateCreate(2020, 01, i);
    ListInsert(list, aux);
    ListTestInvariants(list);
  }

  for (int i = 1; i < 15; i += 2) {
    Date* aux = DateCreate(2020, 01, i);
    ListInsert(list, aux);
    ListTestInvariants(list);
  }

  printf("%d elements\n", ListGetSize(list));

  int i = 0;
  int size = ListGetSize(list);
  ListMove(list, 0);
  while (i < size) {
    Date* p = (Date*)ListGetCurrentItem(list);
    printf("%s\n", DateFormat(p, DMY));
    ListMoveToNext(list);
    i++;
    ListTestInvariants(list);
  }

  printf("\nREMOVING\n");

  ListMoveToHead(list);
  for (int i = 0; i < 7; i++) {
    Date* aux = ListRemoveCurrent(list);
    free(aux);
    ListMoveToNext(list);
    ListTestInvariants(list);
  }

  i = 0;
  size = ListGetSize(list);
  ListMove(list, 0);
  while (i < size) {
    Date* p = (Date*)ListGetCurrentItem(list);
    printf("%s\n", DateFormat(p, DMY));
    ListMoveToNext(list);
    i++;
  }

  return 0;
}
