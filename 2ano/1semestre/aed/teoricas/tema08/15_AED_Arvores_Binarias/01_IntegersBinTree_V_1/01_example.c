//
// Joaquim Madeira, Algoritmos e Estruturas de Dados, November 2023
//
// Integers Binary Tree --- FIRST VERSION --- Test Code
//
// SOME FUNCTIONS ARE INCOMPLETE on IntegersBinTree.c
//

#include <stdio.h>
#include <stdlib.h>

#include "IntegersBinTree.h"

void printInteger(int* p) { printf("%d ", *p); }

void multiplyIntegerBy2(int* p) { *p *= 2; }

int main(void) {
  Tree* tree = createExampleTree();

  printf("Created an example tree\n");

  if (TreeIsEmpty(tree)) {
    printf("The created tree is EMPTY\n");
  } else {
    printf("The created tree is OK\n");
  }

  printf("Number of nodes = %d\n", TreeGetNumberOfNodes(tree));

  printf("Height = %d\n", TreeGetHeight(tree));

  printf("PRE-Order traversal : ");

  TreeTraverseInPREOrder(tree, printInteger);

  printf("\n");

  printf("IN-Order traversal : ");

  TreeTraverseINOrder(tree, printInteger);

  printf("\n");

  printf("POST-Order traversal : ");

  TreeTraverseInPOSTOrder(tree, printInteger);

  printf("\n");

  for (int i = 0; i < 16; i++) {
    if (TreeContains(tree, i)) {
      printf("The tree contains %d\n", i);
    } else {
      printf("The tree DOES NOT CONTAIN %d\n", i);
    }
  }

  printf("Multiply each value by 2\n");

  TreeTraverseInPREOrder(tree, multiplyIntegerBy2);

  printf("PRE-Order traversal : ");

  TreeTraverseInPREOrder(tree, printInteger);

  printf("\n");

  if (TreeEquals(tree, tree)) {
    printf("The tree EQUALS ITSELF\n");
  } else {
    printf("Something WRONG happened!!\n");
  }

  if (TreeMirrors(tree, tree)) {
    printf("Something WRONG happened!!\n");
  } else {
    printf("The tree DOES NOT MIRROR ITSELF\n");
  }

  TreeDestroy(&tree);

  printf("The tree was DESTROYED\n");

  if (TreeIsEmpty(tree)) {
    printf("The tree is NOW EMPTY\n");
  } else {
    printf("Something WRONG happened!!\n");
  }

  return 0;
}
