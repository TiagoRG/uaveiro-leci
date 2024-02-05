/* TAD que permite obter todas as permutacoes de um conjunto de n elementos */
/* Ficheiro de implementacao permutation.c        J. Madeira --- 2010/06/02 */

#include "permutation.h" /* ficheiro de interface do TAD */

#include <stdio.h>
#include <stdlib.h>

static void swapElements(int*, int, int);

int* createFirstPermutation(int n) {
  int i;

  int* p = (int*)malloc(n * sizeof(int));

  for (i = 0; i < n; i++) {
    p[i] = i + 1;
  }

  return p;
}

void copyPermutation(int* original, int* copy, int n) {
  int i;

  for (i = 0; i < n; i++) {
    copy[i] = original[i];
  }
}

void destroyPermutation(int** p) {
  free(*p);
  *p = NULL;
}

void printPermutation(int* p, int n) {
  int i;

  for (i = 0; i < n; i++) {
    printf("%d ", p[i]);
  }

  printf("\n");
}

int nextPermutation(int* v, int n) {
  /* Adapted from
   * http://compprog.wordpress.com/2007/10/08/generating-permutations-2/ */

  int i, j, k;

  /* Find the largest i */

  i = n - 2;
  while ((i >= 0) && (v[i] > v[i + 1])) {
    --i;
  }

  /* If i is smaller than 0, then there are no more permutations. */
  if (i < 0)

  {
    return 0;
  }

  /* Find the largest element after vi but not larger than vi */

  k = n - 1;
  while (v[i] > v[k]) {
    --k;
  }

  swapElements(v, i, k);

  /* Swap the last n - i elements. */

  k = 0;
  for (j = i + 1; j < (n + i) / 2 + 1; ++j, ++k) {
    swapElements(v, j, n - k - 1);
  }

  return 1;
}

/* funcao interna que troca dois elementos do array */
static void swapElements(int* p, int i, int j) {
  int aux = p[i];
  p[i] = p[j];
  p[j] = aux;
}
