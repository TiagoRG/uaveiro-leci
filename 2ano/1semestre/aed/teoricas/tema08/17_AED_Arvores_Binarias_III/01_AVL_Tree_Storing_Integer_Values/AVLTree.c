//
// Joaquim Madeira, May 2020
//
// Integers AVL Tree --- INCOMPLETE
//

#include "AVLTree.h"

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "PointersQueue.h"
#include "PointersStack.h"

struct _AVLTreeNode {
  ItemType item;
  struct _AVLTreeNode* left;
  struct _AVLTreeNode* right;
  int height;
};

AVLTree* AVLTreeCreate(void) { return NULL; }

void AVLTreeDestroy(AVLTree** pRoot) {
  // ...
}

int AVLTreeIsEmpty(const AVLTree* root) { return root == NULL; }

//
// NEW - Adapted from
// https://www.geeksforgeeks.org/check-if-a-binary-tree-is-bst-simple-and-efficient-approach/
//
int _isBST(const AVLTree* root, ItemType* prevItem) {
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
int AVLTreeIsBST(const AVLTree* root) {
  int prevItem = MIN_POSSIBLE;

  return _isBST(root, &prevItem);
}

int AVLTreeEquals(const AVLTree* root1, const AVLTree* root2) {
  // ...
  return 0;
}

int AVLTreeMirrors(const AVLTree* root1, const AVLTree* root2) {
  // ...
  return 0;
}

int AVLTreeGetNumberOfNodes(const AVLTree* root) {
  // ...
  return 0;
}

//
// NEW
//
int AVLTreeGetHeight(const AVLTree* root) {
  if (root == NULL) return -1;

  return root->height;
}

int AVLTreeGetMin(const AVLTree* root) {
  // ...
  return 0;
}

int AVLTreeGetMax(const AVLTree* root) {
  // ...
  return 0;
}

void AVLTreeTraverseInPREOrder(AVLTree* root, void (*function)(ItemType* p)) {
  // ...
}

void AVLTreeTraverseINOrder(AVLTree* root, void (*function)(ItemType* p)) {
  // ...
}

void AVLTreeTraverseInPOSTOrder(AVLTree* root, void (*function)(ItemType* p)) {
  // ...
}

void AVLTreeTraverseLevelByLevelWithQUEUE(AVLTree* root,
                                          void (*function)(ItemType* p)) {
  if (root == NULL) {
    return;
  }

  // Not checking for queue errors !!
  // Create the QUEUE for storing POINTERS

  Queue* queue = QueueCreate();

  QueueEnqueue(queue, root);

  while (QueueIsEmpty(queue) == 0) {
    AVLTree* p = QueueDequeue(queue);

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

void AVLTreeTraverseInPREOrderWithSTACK(AVLTree* root,
                                        void (*function)(ItemType* p)) {}

void AVLTreeTraverseINOrderWithSTACK(AVLTree* root,
                                     void (*function)(ItemType* p)) {}

// ...

int AVLTreeContains(const AVLTree* root, const ItemType item) {
  // ...
  return 0;
}

// Auxiliary functions for tree balancing

static void _updateNodeHeight(AVLTree* t) {
  assert(t != NULL);

  int leftHeight = AVLTreeGetHeight(t->left);

  int rightHeight = AVLTreeGetHeight(t->right);

  if (leftHeight >= rightHeight) {
    t->height = leftHeight + 1;
  } else {
    t->height = rightHeight + 1;
  }
}

static void _singleRotateWithLeftChild(AVLTree** p) {
  AVLTree* pLeft = (*p)->left;

  (*p)->left = pLeft->right;
  pLeft->right = *p;

  _updateNodeHeight(*p);
  _updateNodeHeight(pLeft);

  *p = pLeft;
}

static void _singleRotateWithRightChild(AVLTree** p) {
  AVLTree* pRight = (*p)->right;

  (*p)->right = pRight->left;
  pRight->left = *p;

  _updateNodeHeight(*p);
  _updateNodeHeight(pRight);

  *p = pRight;
}

static void _doubleRotateWithLeftChild(AVLTree** p) {
  _singleRotateWithRightChild(&(*p)->left);
  _singleRotateWithLeftChild(p);
}

static void _doubleRotateWithRightChild(AVLTree** p) {
  _singleRotateWithLeftChild(&(*p)->right);
  _singleRotateWithRightChild(p);
}

static void _balanceNode(AVLTree** pRoot) {
  int leftHeight, rightHeight;

  if (*pRoot == NULL) return;
  leftHeight = AVLTreeGetHeight((*pRoot)->left);
  rightHeight = AVLTreeGetHeight((*pRoot)->right);

  if (leftHeight - rightHeight == 2) {
    leftHeight = AVLTreeGetHeight((*pRoot)->left->left);
    rightHeight = AVLTreeGetHeight((*pRoot)->left->right);
    if (leftHeight >= rightHeight)
      _singleRotateWithLeftChild(pRoot);
    else
      _doubleRotateWithLeftChild(pRoot);
  } else if (rightHeight - leftHeight == 2) {
    rightHeight = AVLTreeGetHeight((*pRoot)->right->right);
    leftHeight = AVLTreeGetHeight((*pRoot)->right->left);
    if (rightHeight >= leftHeight)
      _singleRotateWithRightChild(pRoot);
    else
      _doubleRotateWithRightChild(pRoot);
  } else
    (*pRoot)->height =
        leftHeight > rightHeight ? leftHeight + 1 : rightHeight + 1;
}

//
// NEW
//
int AVLTreeAdd(AVLTree** pRoot, const ItemType item) {
  AVLTree* root = *pRoot;

  if (root == NULL) {
    root = (struct _AVLTreeNode*)malloc(sizeof(*root));
    assert(root != NULL);

    root->item = item;
    root->left = root->right = NULL;
    root->height = 0;

    *pRoot = root;
    return 1;
  }

  if (item < root->item) {
    // Try to insert on the left
    if (AVLTreeAdd(&(root->left), item) == 0) {
      // No success
      return 0;
    }

    // Unbalanced on the left ?
    if (AVLTreeGetHeight(root->left) - AVLTreeGetHeight(root->right) == 2) {
      if (item < root->left->item) {
        _singleRotateWithLeftChild(pRoot);
      } else {
        _doubleRotateWithLeftChild(pRoot);
      }
    }
    _updateNodeHeight(root);
    return 1;
  } else if (item > root->item) {
    // Try to insert on the right
    if (AVLTreeAdd(&(root->right), item) == 0) {
      return 0;
    }

    // Unbalanced on the right ?
    if (AVLTreeGetHeight(root->right) - AVLTreeGetHeight(root->left) == 2) {
      if (item > root->right->item) {
        _singleRotateWithRightChild(pRoot);
      } else {
        _doubleRotateWithRightChild(pRoot);
      }
    }
    _updateNodeHeight(root);
    return 1;
  } else {
    // Not allowed
    return 0;
  }
}

//
// NEW
//
void _deleteNextNode(AVLTree** pRoot, ItemType* pItem) {
  if ((*pRoot)->left == NULL) {
    // FOUND IT
    AVLTree* auxPointer = *pRoot;

    *pItem = auxPointer->item;

    *pRoot = auxPointer->right;

    free(auxPointer);
  } else {
    _deleteNextNode(&((*pRoot)->left), pItem);

    _updateNodeHeight(*pRoot);
  }
}

//
// NEW
//
void _removeNode(AVLTree** pPointer) {
  AVLTree* nodePointer = *pPointer;

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
int AVLTreeRemove(AVLTree** pRoot, const ItemType item) {
  AVLTree* root = *pRoot;

  if (root == NULL) {
    return 0;
  }
  if (root->item == item) {
    _removeNode(pRoot);
    _balanceNode(pRoot);  // Balance at this node
    return 1;
  }
  if (root->item > item) {
    int result = AVLTreeRemove(&(root->left), item);
    if (result) {
      _balanceNode(pRoot);  // Balance at this node
    }
    return result;
  }

  int result = AVLTreeRemove(&(root->right), item);
  if (result) {
    _balanceNode(pRoot);  // Balance at this node
  }
  return result;
}

// ...

// DISPLAYING on the console

static void _displayTree(const AVLTree* root, unsigned int level,
                         void (*printFunc)(ItemType* p)) {
  unsigned int i;

  if (root == NULL) {
    for (i = 0; i <= level; i++) printf("\t");
    printf("*\n");
    return;
  }

  _displayTree(root->right, level + 1, printFunc);

  for (i = 0; i <= level; i++) printf("\t");

  printf("%d\n", root->item);

  _displayTree(root->left, level + 1, printFunc);
}

void AVLTreeDisplay(const AVLTree* root, void (*printFunc)(ItemType* p)) {
  if (root == NULL) {
    return;
  }

  _displayTree(root, 0, printFunc);
}

// Storing and reading from a FILE

struct _fileNode {
  ItemType item;
  int emptyLeftSubAVLTree;
  int emptyRightSubAVLTree;
  int nodeHeight;
};

static void _storeInFile(const AVLTree* root, FILE* f, int fileType) {
  if (root == NULL) {
    return;
  }

  struct _fileNode r;
  r.item = root->item;
  r.emptyLeftSubAVLTree = (root->left == NULL);
  r.emptyRightSubAVLTree = (root->right == NULL);
  r.nodeHeight = root->height;

  if (fileType == 1) {
    fprintf(f, "%d %d %d %d ", r.item, r.nodeHeight, r.emptyLeftSubAVLTree,
            r.emptyRightSubAVLTree);
  } else {
    fwrite(&r, sizeof(struct _fileNode), 1, f);
  }

  _storeInFile(root->left, f, fileType);
  _storeInFile(root->right, f, fileType);
}

static void _getFromFile(AVLTree** pRoot, FILE* f, int fileType) {
  struct _fileNode r;

  if (fileType == 1) {
    fscanf(f, "%d", &r.item);
    fscanf(f, "%d", &r.emptyLeftSubAVLTree);
    fscanf(f, "%d", &r.emptyRightSubAVLTree);
    fscanf(f, "%d", &r.nodeHeight);
  } else {
    fread(&r, sizeof(struct _fileNode), 1, f);
  }

  AVLTree* newNode = (AVLTree*)malloc(sizeof(struct _AVLTreeNode));

  newNode->item = r.item;
  newNode->height = r.nodeHeight;

  if (r.emptyLeftSubAVLTree) {
    newNode->left = NULL;
  } else {
    _getFromFile(&(newNode->left), f, fileType);
  }

  if (r.emptyRightSubAVLTree) {
    newNode->right = NULL;
  } else {
    _getFromFile(&(newNode->right), f, fileType);
  }

  *pRoot = newNode;
}

int AVLTreeStoreInFile(const AVLTree* root, char* fileName, int fileType) {
  FILE* f = fopen(fileName, "w");
  if (f == NULL) {
    return 0;
  }

  _storeInFile(root, f, fileType);

  fclose(f);
  return 1;
}

AVLTree* AVLTreeGetFromFile(char* fileName, int fileType) {
  FILE* f = fopen(fileName, "r");
  if (f == NULL) {
    return NULL;
  }

  AVLTree* root;
  _getFromFile(&root, f, fileType);

  fclose(f);
  return root;
}

// JUST FOR RUNNING EXAMPLES - REMOVE FROM THE INTERFACE

AVLTree* createExampleAVLTree(unsigned int n) {
  int numNodes = 20;

  AVLTree* root = AVLTreeCreate();

  for (int i = 10; i < numNodes; i += 2) {
    AVLTreeAdd(&root, 2 * i + 1);
  }

  for (int i = 0; i < numNodes; i += 2) {
    AVLTreeAdd(&root, 2 * i);
  }

  return root;
}
