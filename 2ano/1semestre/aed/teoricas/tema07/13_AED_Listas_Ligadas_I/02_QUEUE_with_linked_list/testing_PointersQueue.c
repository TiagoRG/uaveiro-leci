
///
// Joaquim Madeira, AlgC, April 2020
//
// Adapted from Tomás Oliveira e Silva, AED, September 2015
//
// Pointers queue (First In First Out) implementation based on an array
// of pointers
//
// TESTING the implementation
//

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "PointersQueue.h"

int main(void) {
  Queue* Q = QueueCreate();

  int i = 0;
  int o = 0;

  for (int n = 0; n < 2000000; n++) {
    if (QueueSize(Q) == 0 ||
        (QueueSize(Q) < 20 && (rand() & 0x01000000) == 0)) {
      int* aux = malloc(sizeof(int));
      *aux = i;
      QueueEnqueue(Q, aux);
      i++;
    } else {
      int* aux = (int*)QueueDequeue(Q);
      assert(*aux == o);
      o++;
      free(aux);
    }
    if (QueueSize(Q) > 0) {
      int* aux = (int*)QueuePeek(Q);
      assert(*aux == o);
    }
  }
  while (QueueSize(Q) > 0) {
    int* aux = (int*)QueueDequeue(Q);
    printf("%d\n", *aux);
    free(aux);
  }

  printf("All is well [i = %d, o = %d]\n", i, o);

  return 0;
}
