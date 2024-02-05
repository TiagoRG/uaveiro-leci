/* A magic square is a n x n matrix, whose elements are a permutation of the
   integers from 1 to n x n, which satisfies the following:

   The sum of the n elements in each row is equal to the sum of the n elements
   in each colummn, and is also equal to the sum of the n elements of the two
   diagonals.

                            J. Madeira --- 2010/06/02
*/

#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#include "permutation.h"

int isMagicSquare(int*, int);
void printMagicSquare(int*, int);
void magicSquaresSearch(int);

int main(void) {
  int n = 9;

  magicSquaresSearch(n);

  return 0;
}

int isMagicSquare(int* a, int size) {
  int i, j;
  int sum;
  int n = (int)sqrt(size);

  int* sumRow = (int*)calloc(n, sizeof(int));
  int* sumColumn = (int*)calloc(n, sizeof(int));
  int* sumDiag = (int*)calloc(2, sizeof(int));

  /* Adding the elements */

  for (i = 0; i < n; i++) {
    for (j = 0; j < n; j++) {
      sumRow[i] += a[j + i * n];
      sumColumn[j] += a[j + i * n];

      if (i == j) {
        /* Main diagonal */
        sumDiag[0] += a[j + i * n];
      }

      if ((i + j) == (n - 1)) {
        /* The other diagonal */
        sumDiag[1] += a[j + i * n];
      }
    }
  }

  /* Checking the diagonals */

  if (sumDiag[0] != sumDiag[1]) {
    free(sumRow);
    free(sumColumn);
    free(sumDiag);
    return 0;
  }

  sum = sumDiag[0];

  /* Checking the rows */

  for (i = 0; i < n; i++) {
    if (sumRow[i] != sum) {
      free(sumRow);
      free(sumColumn);
      free(sumDiag);
      return 0;
    }
  }

  /* Checking the columns */

  for (i = 0; i < n; i++) {
    if (sumColumn[i] != sum) {
      free(sumRow);
      free(sumColumn);
      free(sumDiag);
      return 0;
    }
  }

  free(sumRow);
  free(sumColumn);
  free(sumDiag);

  return sum;
}

void printMagicSquare(int* a, int size) {
  int i, j;

  int n = (int)sqrt(size);

  printf("\n");

  for (i = 0, j = 0; i < size; i++) {
    printf("%3d", a[i]);

    j++;

    if (j == n) {
      printf("\n");

      j = 0;
    }
  }

  printf("\n");
}

void magicSquaresSearch(int size) {
  /* Gerar todas as permutacoes dos elementos do array */
  /* Verificar, para cada uma, se se trata de um quadrado magico */

  int sum;
  int permutationIndex = 1;
  int* p;
  p = createFirstPermutation(size);

  do {
    if ((sum = isMagicSquare(p, size))) {
      printf(" *** Permutation %d is a magic square of sum %d :\n\n",
             permutationIndex, sum);
      printMagicSquare(p, size);
    }
    permutationIndex++;
  } while (nextPermutation(p, size));

  destroyPermutation(&p);
}
