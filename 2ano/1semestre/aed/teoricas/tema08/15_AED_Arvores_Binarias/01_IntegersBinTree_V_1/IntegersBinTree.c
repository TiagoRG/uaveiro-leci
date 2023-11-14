//
// Joaquim Madeira, Algoritmos e Estruturas de Dados, November 2023
//
// Adapted from an old example (2003, 2020)
//
// Integers Binary Tree --- FIRST VERSION --- INCOMPLETE
//

#include "IntegersBinTree.h"

#include <assert.h>
#include <stdlib.h>

struct _TreeNode {
  ItemType item;
  struct _TreeNode* left;
  struct _TreeNode* right;
};

Tree* TreeCreate(void) { return NULL; }

void TreeDestroy(Tree** pRoot) {
  // ...
}

int TreeIsEmpty(const Tree* root) { return root == NULL; }

int TreeEquals(const Tree* root1, const Tree* root2) {
  // ...
  return 0;
}

int TreeMirrors(const Tree* root1, const Tree* root2) {
  // ...
  return 0;
}

int TreeGetNumberOfNodes(const Tree* root) {
  // ...
  return 0;
}

int TreeGetHeight(const Tree* root) {
  // ...
  return 0;
}

void TreeTraverseInPREOrder(Tree* root, void (*function)(ItemType* p)) {
  // ...
}

void TreeTraverseINOrder(Tree* root, void (*function)(ItemType* p)) {
  // ...
}

void TreeTraverseInPOSTOrder(Tree* root, void (*function)(ItemType* p)) {
  // ...
}

// ...

int TreeContains(const Tree* root, const ItemType item) {
  // ...
  return 0;
}

int TreeAdd(Tree** pRoot, const ItemType item) {
  // ...
  return 0;
}

int TreeRemove(Tree** pRoot, const ItemType item) {
  // ...
  return 0;
}

// ...

// JUST FOR RUNNING EXAMPLES - REMOVE FROM THE INTERFACE

Tree* createExampleTree(void) {
  // SHOULD NEVER BE DONE LIKE THIS !!!???!!!

  int numNodes = 8;

  Tree* nodes[numNodes];

  for (int i = 0; i < numNodes; i++) {
    nodes[i] = (Tree*)malloc(sizeof(Tree));
    nodes[i]->item = i + 1;
    nodes[i]->left = nodes[i]->right = NULL;
  }

  nodes[3]->left = nodes[7];

  nodes[1]->left = nodes[3];
  nodes[1]->right = nodes[4];

  nodes[2]->left = nodes[5];
  nodes[2]->right = nodes[6];

  nodes[0]->left = nodes[1];
  nodes[0]->right = nodes[2];

  return nodes[0];
}
