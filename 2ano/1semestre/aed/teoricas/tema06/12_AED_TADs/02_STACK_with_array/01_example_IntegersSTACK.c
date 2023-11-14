
//
// Algoritmos e Estruturas de Dados - 2023/2024 - 1o semestre
//
// J. Madeira - April 2020
//
// Writing the digits of a decimal number in reverse order
//
// Integers STACK : usage example
//

#include <stdio.h>

#include "IntegersStack.h"

int main(void) {
  int number;

  printf("Write a positive integer value:\n");

  scanf("%d", &number);

  // Creating an empty STACK for integers

  Stack* s1 = StackCreate(20);

  // Get each digit and push it into the stack
  // LS digit to MS digit

  while (number != 0) {
    int digit = number % 10;

    StackPush(s1, digit);

    number /= 10;
  }

  // Get the reversed order using a second stack

  Stack* s2 = StackCreate(20);

  while (!StackIsEmpty(s1)) {
    int digit = StackPop(s1);

    StackPush(s2, digit);
  }

  // Destroy the empty stack

  StackDestroy(&s1);

  // Pop from the stack and print

  printf("The reversed number:\n");

  while (!StackIsEmpty(s2)) {
    int digit;

    digit = StackPop(s2);

    printf("%d", digit);
  }

  printf("\n");

  return 0;
}
