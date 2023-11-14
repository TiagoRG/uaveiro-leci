
/*****************************************************************************
 ***
 *** Algoritmos e Complexidade
 ***
 *** Ano lectivo 2019/2020 --- 2o. Semestre
 ***
 *** DETI - Universidade de Aveiro
 ***
 *****************************************************************************
 ***
 *** Ficheiro:	01_exemplo_PointersSTACK.c
 *** Autor:     Joaquim Madeira
 *** Data:      22/04/2020
 *** Versao:    1.00
 ***
 *****************************************************************************
 ***
 *** Informacao:
 ***
 ***   Escrever os algarismos de um numero pela ordem inversa.
 ***
 ***   STACK generico de ponteiros: exemplo de utilizacao
 ***
 *****************************************************************************
 ***
 *** Alteracoes:   0.0    22/04/2020   Autor
 ***
 ***   Sem alteracoess.
 ***
 *****************************************************************************/

#include <stdio.h>
#include <stdlib.h>

#include "PointersStack.h"

int main(void) {
  int number;

  printf("Write a positive integer value:\n");

  scanf("%d", &number);

  // Creating an empty STACK for integers

  Stack* s1 = StackCreate();

  // Get each digit and push it into the stack
  // LS digit to MS digit

  while (number != 0) {
    int* p = malloc(sizeof(int));

    *p = number % 10;

    StackPush(s1, p);

    number /= 10;
  }

  // Get the reversed order using a second stack

  Stack* s2 = StackCreate();

  while (!StackIsEmpty(s1)) {
    int* p = (int*)StackPop(s1);

    StackPush(s2, p);
  }

  // Destroy the empty stack

  StackDestroy(&s1);

  // Pop from the stack and print

  printf("The reversed number:\n");

  while (!StackIsEmpty(s2)) {
    int* p;

    p = (int*)StackPop(s2);

    printf("%d", *p);

    free(p);
  }

  printf("\n");

  // Destroy the empty stack

  StackDestroy(&s2);

  return 0;
}
