//
// Joaquim Madeira, May 2020
//
// Integers AVL Tree --- INCOMPLETE
//

#include <stdio.h>
#include <stdlib.h>

#include "AVLTree.h"

void printInteger(int* p) { printf("%d ", *p); }

void printIntegerForTreeDisplay(int* p) { printf("%d ", *p); }

void multiplyIntegerBy2(int* p) { *p *= 2; }

int main(void) {
  AVLTree* tree = createExampleAVLTree(16);

  if (AVLTreeIsBST(tree)) {
    printf("Created an example AVLTree that is a BST\n");
  } else {
    printf("The created AVLTree is NOT a BST\n");
  }

  if (AVLTreeIsEmpty(tree)) {
    printf("The created AVLTree is EMPTY\n");
  } else {
    printf("The created AVLTree is OK\n");
  }

  printf("Number of nodes = %d\n", AVLTreeGetNumberOfNodes(tree));

  printf("Height = %d\n", AVLTreeGetHeight(tree));

  printf("SMALLEST value = %d\n", AVLTreeGetMin(tree));

  printf("LARGEST value = %d\n", AVLTreeGetMax(tree));

  printf("PRE-Order traversal : ");

  AVLTreeTraverseInPREOrder(tree, printInteger);

  printf("\n");

  printf("IN-Order traversal : ");

  AVLTreeTraverseINOrder(tree, printInteger);

  printf("\n");

  printf("POST-Order traversal : ");

  AVLTreeTraverseInPOSTOrder(tree, printInteger);

  printf("\n");

  printf("LEVEL-by-LEVEL traversal using a QUEUE: ");

  AVLTreeTraverseLevelByLevelWithQUEUE(tree, printInteger);

  printf("\n");

  AVLTreeDisplay(tree, printIntegerForTreeDisplay);

  printf("REMOVING some elements\n");

  for (int i = 0; i < 25; i++) {
    AVLTreeRemove(&tree, i);
  }

  printf("PRE-Order traversal : ");

  AVLTreeTraverseInPREOrder(tree, printInteger);

  printf("\n");

  printf("IN-Order traversal : ");

  AVLTreeTraverseINOrder(tree, printInteger);

  printf("\n");

  printf("POST-Order traversal : ");

  AVLTreeTraverseInPOSTOrder(tree, printInteger);

  printf("\n");

  printf("LEVEL-by-LEVEL traversal using a QUEUE: ");

  AVLTreeTraverseLevelByLevelWithQUEUE(tree, printInteger);

  printf("\n");

  AVLTreeDestroy(&tree);

  printf("The AVLTree was DESTROYED\n");

  if (AVLTreeIsEmpty(tree)) {
    printf("The AVLTree is NOW EMPTY\n");
  } else {
    printf("Something WRONG happened!!\n");
  }

  printf("Inserting the natural numbers:\n");

  for (int i = 1; i < 13; i++) {
    AVLTreeAdd(&tree, i);
    printf("--\n");
    AVLTreeDisplay(tree, printIntegerForTreeDisplay);
    printf("--\n");
  }

  AVLTreeStoreInFile(tree, "arvore.txt", 1);
  return 0;
}
