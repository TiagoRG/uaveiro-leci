
//
// Algoritmos e Estruturas de Dados - 2023/2024 - 1o semestre
//
// Joaquim Madeira, April 2020
//
// Adapted from Tomás Oliveira e Silva, AED, September 2015
//
// Integers queue (First In First Out) implementation based on an array
//
// TESTING the implementation
//

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "IntegersQueue.h"

int main(void) {
  Queue* Q = QueueCreate(100);

  int i = 0;
  int o = 0;

  for (int n = 0; n < 2000000; n++) {
    if (QueueSize(Q) == 0 ||
        (QueueSize(Q) < 20 && (rand() & 0x01000000) == 0)) {
      QueueEnqueue(Q, i);
      i++;
    } else {
      int aux = QueueDequeue(Q);
      assert(aux == o);
      o++;
    }
    if (QueueSize(Q) > 0) {
      int aux = QueuePeek(Q);
      assert(aux == o);
    }
  }
  while (QueueSize(Q) > 0) {
    int aux = QueueDequeue(Q);
    printf("%d\n", aux);
  }

  printf("All is well [i = %d, o = %d]\n", i, o);

  return 0;
}
