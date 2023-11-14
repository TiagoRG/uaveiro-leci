//
// Joaquim Madeira, Algoritmos e Estruturas de Dados, November 2023
//
// Adapted from an old example...
//
// Integers Binary Search Tree --- INCOMPLETE
//

#include "BinarySearchTree.h"

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "PointersQueue.h"
#include "PointersStack.h"

struct _BSTreeNode {
  ItemType item;
  struct _BSTreeNode* left;
  struct _BSTreeNode* right;
};

BSTree* BSTreeCreate(void) { return NULL; }

void BSTreeDestroy(BSTree** pRoot) {
  // ...
}

int BSTreeIsEmpty(const BSTree* root) { return root == NULL; }

//
// NEW - Adapted from
// https://www.geeksforgeeks.org/check-if-a-binary-tree-is-bst-simple-and-efficient-approach/
//
int _isBST(const BSTree* root, ItemType* prevItem) {
  if (root == NULL) {
    return 1;
  }
  // IN_ORDER TRAVERSAL
  if (_isBST(root->left, prevItem) == 0) {
    return 0;
  }
  // Allow only distinct valued nodes
  if (root->item <= *prevItem) {
    return 0;
  }
  // Update prevValue to current
  *prevItem = root->item;

  return _isBST(root->right, prevItem);
}
//
// NEW
//
int BSTreeIsBST(const BSTree* root) {
  int prevItem = MIN_POSSIBLE;

  return _isBST(root, &prevItem);
}

int BSTreeEquals(const BSTree* root1, const BSTree* root2) {
  // ...
  return 0;
}

int BSTreeMirrors(const BSTree* root1, const BSTree* root2) {
  // ...
  return 0;
}

int BSTreeGetNumberOfNodes(const BSTree* root) {
  // ...
  return 0;
}

int BSTreeGetHeight(const BSTree* root) {
  // ...
  return 0;
}

int BSTreeGetMin(const BSTree* root) {
  // ...
  return 0;
}

int BSTreeGetMax(const BSTree* root) {
  // ...
  return 0;
}

void BSTreeTraverseInPREOrder(BSTree* root, void (*function)(ItemType* p)) {
  // ...
}

void BSTreeTraverseINOrder(BSTree* root, void (*function)(ItemType* p)) {
  // ...
}

void BSTreeTraverseInPOSTOrder(BSTree* root, void (*function)(ItemType* p)) {
  // ...
}

void BSTreeTraverseLevelByLevelWithQUEUE(BSTree* root,
                                         void (*function)(ItemType* p)) {
  if (root == NULL) {
    return;
  }

  // Not checking for queue errors !!
  // Create the QUEUE for storing POINTERS

  Queue* queue = QueueCreate();

  QueueEnqueue(queue, root);

  while (QueueIsEmpty(queue) == 0) {
    BSTree* p = QueueDequeue(queue);

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

void BSTreeTraverseInPREOrderWithSTACK(BSTree* root,
                                       void (*function)(ItemType* p)) {}

void BSTreeTraverseINOrderWithSTACK(BSTree* root,
                                    void (*function)(ItemType* p)) {}

// ...

int BSTreeContains(const BSTree* root, const ItemType item) {
  // ...
  return 0;
}

//
// NEW
//
int BSTreeAdd(BSTree** pRoot, const ItemType item) {
  BSTree* root = *pRoot;

  struct _BSTreeNode* new = (struct _BSTreeNode*)malloc(sizeof(*new));
  assert(new != NULL);

  new->item = item;
  new->left = new->right = NULL;

  if (root == NULL) {
    *pRoot = new;
    return 1;
  }

  struct _BSTreeNode* prev = NULL;
  struct _BSTreeNode* current = root;

  while (current != NULL) {
    if (current->item == item) {
      free(new);
      return 0;
    }  // Not allowed

    prev = current;
    if (current->item > item) {
      current = current->left;
    } else {
      current = current->right;
    }
  }

  if (prev->item > item) {
    prev->left = new;
  } else {
    prev->right = new;
  }
  return 0;
}

//
// NEW
//
void _deleteNextNode(BSTree** pRoot, ItemType* pItem) {
  if ((*pRoot)->left == NULL) {
    // FOUND IT
    BSTree* auxPointer = *pRoot;

    *pItem = auxPointer->item;

    *pRoot = auxPointer->right;

    free(auxPointer);
  } else {
    _deleteNextNode(&((*pRoot)->left), pItem);
  }
}

//
// NEW
//
void _removeNode(BSTree** pPointer) {
  BSTree* nodePointer = *pPointer;

  if ((nodePointer->left == NULL) && (nodePointer->right == NULL)) {
    /* A LEAF node */

    free(nodePointer);

    *pPointer = NULL;

    return;
  }

  if (nodePointer->left == NULL) {
    /* It has only a RIGHT sub-tree */

    *pPointer = nodePointer->right;

    free(nodePointer);

    return;
  }

  if (nodePointer->right == NULL) {
    /* It has only a LEFT sub-tree */

    *pPointer = nodePointer->left;

    free(nodePointer);

    return;
  }

  /* Node has TWO CHILDREN */
  /* Replace its item with the item of the next node in-order */
  /* And remove that node */

  _deleteNextNode(&(nodePointer->right), &(nodePointer->item));
}

//
// NEW - Search for the node and remove it
//       with the help an auxiliary function
//
int BSTreeRemove(BSTree** pRoot, const ItemType item) {
  BSTree* root = *pRoot;

  if (root == NULL) {
    return 0;
  }
  if (root->item == item) {
    _removeNode(pRoot);
    return 1;
  }
  if (root->item > item) {
    return BSTreeRemove(&(root->left), item);
  }

  return BSTreeRemove(&(root->right), item);
}

// ...

// Storing and reading from a FILE

struct _fileNode {
  ItemType item;
  int emptyLeftSubBSTree;
  int emptyRightSubBSTree;
};

static void _storeInFile(const BSTree* root, FILE* f, int fileType) {
  if (root == NULL) {
    return;
  }

  struct _fileNode r;
  r.item = root->item;
  r.emptyLeftSubBSTree = (root->left == NULL);
  r.emptyRightSubBSTree = (root->right == NULL);

  if (fileType == 1) {
    fprintf(f, "%d %d %d ", r.item, r.emptyLeftSubBSTree,
            r.emptyRightSubBSTree);
  } else {
    fwrite(&r, sizeof(struct _fileNode), 1, f);
  }

  _storeInFile(root->left, f, fileType);
  _storeInFile(root->right, f, fileType);
}

static void _getFromFile(BSTree** pRoot, FILE* f, int fileType) {
  struct _fileNode r;

  if (fileType == 1) {
    fscanf(f, "%d", &r.item);
    fscanf(f, "%d", &r.emptyLeftSubBSTree);
    fscanf(f, "%d", &r.emptyRightSubBSTree);
  } else {
    fread(&r, sizeof(struct _fileNode), 1, f);
  }

  BSTree* newNode = (BSTree*)malloc(sizeof(struct _BSTreeNode));

  newNode->item = r.item;

  if (r.emptyLeftSubBSTree) {
    newNode->left = NULL;
  } else {
    _getFromFile(&(newNode->left), f, fileType);
  }

  if (r.emptyRightSubBSTree) {
    newNode->right = NULL;
  } else {
    _getFromFile(&(newNode->right), f, fileType);
  }

  *pRoot = newNode;
}

int BSTreeStoreInFile(const BSTree* root, char* fileName, int fileType) {
  FILE* f = fopen(fileName, "w");
  if (f == NULL) {
    return 0;
  }

  _storeInFile(root, f, fileType);

  fclose(f);
  return 1;
}

BSTree* BSTreeGetFromFile(char* fileName, int fileType) {
  FILE* f = fopen(fileName, "r");
  if (f == NULL) {
    return NULL;
  }

  BSTree* root;
  _getFromFile(&root, f, fileType);

  fclose(f);
  return root;
}

// JUST FOR RUNNING EXAMPLES - REMOVE FROM THE INTERFACE

//
// TO DO : change to BST
//
BSTree* createExampleBSTree(unsigned int n) {
  int numNodes = 20;

  BSTree* root = BSTreeCreate();

  for (int i = 10; i < numNodes; i += 2) {
    BSTreeAdd(&root, 2 * i + 1);
  }

  for (int i = 0; i < numNodes; i += 2) {
    BSTreeAdd(&root, 2 * i);
  }

  return root;
}
