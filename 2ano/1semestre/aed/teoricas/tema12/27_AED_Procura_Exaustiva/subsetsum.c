#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#include "binarycounter.h" /* ficheiro de interface do TAD */

void solutionFound(int, int*, int, int*);
void subsetSumSearch(int*, int, int);

int main(void) {
  int n, soma;

  int array[] = {1,  2,  3,  4,  5,  6,  7,  8,  9,  10,
                 11, 12, 13, 14, 15, 16, 17, 18, 19, 20};

  n = sizeof(array) / sizeof(int);

  printf("Soma? ");
  scanf("%d", &soma);

  subsetSumSearch(array, n, soma);

  return 0;
}

void solutionFound(int sum, int* a, int size, int* validIndices) {
  int i;

  int flag = 0;

  int s = 0;

  printf("%d = ", sum);

  for (i = 0; i < size; i++) {
    if (validIndices[i]) {
      s += a[i];

      if (flag) {
        printf(" + ");
      } else {
        flag = 1;
      }

      printf("%d", a[i]);
    }
  }

  printf("\n");

  flag = 0;

  printf("%d = ", sum);

  for (i = 0; i < size; i++) {
    if (validIndices[i]) {
      if (flag) {
        printf(" + ");
      } else {
        flag = 1;
      }

      printf("a[%d]", i);
    }
  }

  printf("\n");

  if (s != sum) {
    printf("ERRO !!!\n");
  }

  printf("\n");
}

void subsetSumSearch(int* a, int size, int sum) {
  // Gerar todos os sub-conjuntos dos indices do array
  // Verificar, para cada um, o valor da soma dos elementos
  // Aproveitar a representacao binaria para os gerar !

  int subSetIndex;

  int sumElements;

  int i;

  // O numero de sub-conjuntos e 2^n

  int numSubSets = (int)pow(2.0, size);

  // Nao se testa o (sub-)conjunto vazio

  int* binaryCounter = createBinCounter(size);

  for (subSetIndex = 1; subSetIndex < numSubSets; subSetIndex++) {
    sumElements = 0;

    increaseBinCounter(binaryCounter, size);

    for (i = 0; i < size; i++) {
      if (binaryCounter[i] && ((sumElements += a[i]) > sum)) {
        break; /* Eficiencia --- Testar tambem sem este break !!*/
      }
    }

    // Listar todas as solucoes encontradas

    if (sumElements == sum) {
      solutionFound(sum, a, size, binaryCounter);
    }
  }

  destroyBinCounter(&binaryCounter);
}
