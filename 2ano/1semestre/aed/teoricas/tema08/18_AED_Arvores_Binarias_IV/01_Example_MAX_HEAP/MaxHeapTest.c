//
// João Manuel Rodrigues, AlgC, May 2020
// Joaquim Madeira, AlgC, May 2020
//
// TESTING the TAD MaxHeap implementation
//

// This program accepts multiple arguments.
// If the argument is:
// a number : it is inserted into a max-heap.
//    -     : the first (maximum) item is removed from the head
//    ?     : the heap content is shown, both in tree form and array form.

// Try the arguments below.

// ARGS 1 2 3 4 5 6 ?
// ARGS 6 5 4 3 2 1 ?
// ARGS 3 5 2 1 6 4 ?
// ARGS 5 6 3 1 4 2 ?
// ARGS 5 6 3 ? 1 ? 4 ? 2 ?
// ARGS 8 4 9 4 3 1 10 2 5 7 11 6 ?
// ARGS 5 6 3 ? - ? 1 ? 4 ? 2 ? - ? - ? - ? - ?

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "MaxHeap.h"

// Storing pointers to integers

// The comparator for integer items

int comparator(const void* p1, const void* p2) {
  int d = *(int*)p1 - *(int*)p2;
  return (d > 0) - (d < 0);
}

// The printer for integer items

void printer(void* p) { printf("%d ", *(int*)p); }

int main(int argc, char* argv[]) {
  printf("CREATE AN EMPTY HEAP\n");
  // with capacity for at most argc items
  MaxHeap* h1 = MaxHeapCreate(argc, comparator, printer);
  printf("Capacity = %d\n", MaxHeapCapacity(h1));
  printf("Size = %d\n", MaxHeapSize(h1));

  printf("\nPROCESS ARGS\n");
  for (int i = 1; i < argc; i++) {
    int* aux;
    char* arg = argv[i];
    printf("ARG %s: ", arg);
    switch (arg[0]) {
      case '?':  // View and Check
        printf("View\n");
        MaxHeapView(h1);  // for debugging
        printf("Check: %s\n", MaxHeapCheck(h1) ? "OK" : "ERROR");
        break;
      case '-':
        aux = (int*)MaxHeapGetMax(h1);
        printf("Removing %d\n", *aux);
        MaxHeapRemoveMax(h1);
        free(aux);
        break;
      default:  // assume it's an item to insert
        aux = (int*)malloc(sizeof(*aux));
        *aux = atoi(arg);
        printf("Inserting %d\n", *aux);
        MaxHeapInsert(h1, aux);
    }
  }
  printf("\nFINISHED ARGS\n");

  printf("Size = %d\n", MaxHeapSize(h1));

  printf("\nREMOVING REMAINING ITEMS\n");
  while (!MaxHeapIsEmpty(h1)) {
    int* aux = (int*)MaxHeapGetMax(h1);
    printf("Removing %d\n", *aux);
    MaxHeapRemoveMax(h1);
    free(aux);
  }
  printf("\nFINISHED REMOVING\n");
  MaxHeapView(h1);

  MaxHeapDestroy(&h1);

  return 0;
}
