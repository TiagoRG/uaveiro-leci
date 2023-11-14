//
// Joaquim Madeira, Algoritmos e Estruturas de Dados, November 2023
//
// Integers Binary Tree --- SECOND VERSION --- INCOMPLETE
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

  printf("SMALLEST value = %d\n", TreeGetMin(tree));

  printf("LARGEST value = %d\n", TreeGetMax(tree));

  printf("PRE-Order traversal : ");

  TreeTraverseInPREOrder(tree, printInteger);

  printf("\n");

  printf("IN-Order traversal : ");

  TreeTraverseINOrder(tree, printInteger);

  printf("\n");

  printf("POST-Order traversal : ");

  TreeTraverseInPOSTOrder(tree, printInteger);

  printf("\n");

  printf("LEVEL-by-LEVEL traversal using a QUEUE: ");

  TreeTraverseLevelByLevelWithQUEUE(tree, printInteger);

  printf("\n");

  printf("PRE-Order traversal using a STACK : ");

  TreeTraverseInPREOrderWithSTACK(tree, printInteger);

  printf("\n");

  printf("IN-Order traversal using a STACK: ");

  TreeTraverseINOrderWithSTACK(tree, printInteger);

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

  printf("STORING in a file\n");

  TreeStoreInFile(tree, "arvore1.txt", 1);

  printf("READING from a file\n");

  Tree* treeFromFile = TreeGetFromFile("arvore1.txt", 1);

  printf("FINISHED READING from a file\n");

  if (TreeEquals(tree, treeFromFile)) {
    printf("The tree EQUALS the one read from file\n");
  } else {
    printf("Something WRONG happened!!\n");
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
