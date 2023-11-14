//
// Joaquim Madeira, Algoritmos e Estruturas de Dados, November 2023
//
// Adapted from an old example...
//
// Integers Binary Tree --- SECOND VERSION --- INCOMPLETE
//

#include "IntegersBinTree.h"

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "PointersQueue.h"
#include "PointersStack.h"

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

int TreeGetMin(const Tree* root) {
  // ...
  return 0;
}

int TreeGetMax(const Tree* root) {
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

void TreeTraverseLevelByLevelWithQUEUE(Tree* root,
                                       void (*function)(ItemType* p)) {
  if (root == NULL) {
    return;
  }

  // Not checking for queue errors !!
  // Create the QUEUE for storing POINTERS

  Queue* queue = QueueCreate();

  QueueEnqueue(queue, root);

  while (QueueIsEmpty(queue) == 0) {
    Tree* p = QueueDequeue(queue);

    function(&(p->item));

    if (p->left != NULL) {
      QueueEnqueue(queue, p->left);
    }
    if (p->right != NULL) {
      QueueEnqueue(queue, p->right);
    }
  }

  QueueDestroy(&queue);
}

void TreeTraverseInPREOrderWithSTACK(Tree* root,
                                     void (*function)(ItemType* p)) {}

void TreeTraverseINOrderWithSTACK(Tree* root, void (*function)(ItemType* p)) {}

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

// Storing and reading from a FILE

struct _fileNode {
  ItemType item;
  int emptyLeftSubTree;
  int emptyRightSubTree;
};

static void _storeInFile(const Tree* root, FILE* f, int fileType) {
  if (root == NULL) {
    return;
  }

  struct _fileNode r;
  r.item = root->item;
  r.emptyLeftSubTree = (root->left == NULL);
  r.emptyRightSubTree = (root->right == NULL);

  if (fileType == 1) {
    fprintf(f, "%d %d %d ", r.item, r.emptyLeftSubTree, r.emptyRightSubTree);
  } else {
    fwrite(&r, sizeof(struct _fileNode), 1, f);
  }

  _storeInFile(root->left, f, fileType);
  _storeInFile(root->right, f, fileType);
}

static void _getFromFile(Tree** pRoot, FILE* f, int fileType) {
  struct _fileNode r;

  if (fileType == 1) {
    fscanf(f, "%d", &r.item);
    fscanf(f, "%d", &r.emptyLeftSubTree);
    fscanf(f, "%d", &r.emptyRightSubTree);
  } else {
    fread(&r, sizeof(struct _fileNode), 1, f);
  }

  Tree* newNode = (Tree*)malloc(sizeof(struct _TreeNode));

  newNode->item = r.item;

  if (r.emptyLeftSubTree) {
    newNode->left = NULL;
  } else {
    _getFromFile(&(newNode->left), f, fileType);
  }

  if (r.emptyRightSubTree) {
    newNode->right = NULL;
  } else {
    _getFromFile(&(newNode->right), f, fileType);
  }

  *pRoot = newNode;
}

int TreeStoreInFile(const Tree* root, char* fileName, int fileType) {
  FILE* f = fopen(fileName, "w");
  if (f == NULL) {
    return 0;
  }

  _storeInFile(root, f, fileType);

  fclose(f);
  return 1;
}

Tree* TreeGetFromFile(char* fileName, int fileType) {
  FILE* f = fopen(fileName, "r");
  if (f == NULL) {
    return NULL;
  }

  Tree* root;
  _getFromFile(&root, f, fileType);

  fclose(f);
  return root;
}

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
