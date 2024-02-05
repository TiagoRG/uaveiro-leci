#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#include "binarycounter.h" /* ficheiro de interface do TAD */

void solutionKnapsack(int, float*, float*, int, float, int*);
int* knapsackSearch(float*, float*, int, float);

int main(void) {
  int n;
  float capacidade;

  float w[] = {1,  2,  3,  4,  5,  6,  7,  8,  9,  10,
               11, 12, 13, 14, 15, 16, 17, 18, 19, 20};

  float v[] = {1,  2,  3,  4,  5,  6,  7,  8,   9,  100,
               12, 32, 44, 14, 15, 16, 17, 128, 29, 20};

  n = sizeof(w) / sizeof(float);

  do {
    printf("Capacidade da mochila? ");
    scanf("%f", &capacidade);
  } while (capacidade <= 0.0);

  knapsackSearch(w, v, n, capacidade);

  return 0;
}

void solutionKnapsack(int solNumber, float* weight, float* value, int n,
                      float capacity, int* validIndices) {
  int i;

  int flag = 0;

  float w = 0.0;

  float v = 0.0;

  printf("Knapsack capacity = %f --- Solution number = %d\n", capacity,
         solNumber);

  printf("Set of items = ");

  for (i = 0; i < n; i++) {
    if (validIndices[i]) {
      if (flag) {
        printf(" + ");
      } else {
        flag = 1;
      }

      printf("item[%d]", i);
    }
  }

  printf("\n");

  flag = 0;

  printf("Total weight = ");

  for (i = 0; i < n; i++) {
    if (validIndices[i]) {
      w += weight[i];

      if (flag) {
        printf(" + ");
      } else {
        flag = 1;
      }

      printf("%.2f", weight[i]);
    }
  }

  printf(" = %.2f\n", w);

  flag = 0;

  printf("Total value = ");

  for (i = 0; i < n; i++) {
    if (validIndices[i]) {
      v += value[i];

      if (flag) {
        printf(" + ");
      } else {
        flag = 1;
      }

      printf("%.2f", value[i]);
    }
  }

  printf(" = %.2f\n", v);

  printf("\n");
}

int* knapsackSearch(float* weight, float* value, int n, float capacity) {
  /* Gerar todos os sub-conjuntos dos indices do array de items */
  /* Aproveitar a representacao binaria para os gerar ! */
  /* Verificar, para cada um, o valor da soma dos pesos e dos valores */

  int subSetIndex;

  float sumWeights;

  float sumValues, maxSumValues = 0.0;

  int i;

  /* O numero de sub-conjuntos e 2^n */

  int numSubSets = (int)pow(2.0, n);

  /* Nao se testa o (sub-)conjunto vazio */

  int* binaryCounter = createBinCounter(n);

  int* currentBestSol = createBinCounter(n);

  for (subSetIndex = 1; subSetIndex < numSubSets; subSetIndex++) {
    sumWeights = 0;
    sumValues = 0;

    increaseBinCounter(binaryCounter, n);

    for (i = 0; i < n; i++) {
      if (binaryCounter[i] && ((sumWeights += weight[i]) > capacity)) {
        break; /* EficiEncia --- Testar tambem sem este break !! */
      }
      if (binaryCounter[i]) {
        sumValues += value[i];
      }
    }

    if (sumValues > maxSumValues) {
      maxSumValues = sumValues;

      copyBinCounter(binaryCounter, currentBestSol, n);

      /* Listar as sucessivas melhores solucoes */

      solutionKnapsack(subSetIndex, weight, value, n, capacity, binaryCounter);
    }

    /* Poderia listar tambem eventuais solucoes alternativas !! */
  }

  destroyBinCounter(&binaryCounter);

  return currentBestSol;
}
