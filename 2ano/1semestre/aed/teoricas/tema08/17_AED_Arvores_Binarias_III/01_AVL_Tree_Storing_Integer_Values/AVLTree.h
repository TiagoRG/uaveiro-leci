//
// Joaquim Madeira, May 2020
//
// Integers AVL Tree --- INCOMPLETE
//

#ifndef _AVL_Tree_
#define _AVL_Tree_

#include <limits.h>

// JUST storing integers
typedef int ItemType;

static int NO_ITEM = INT_MAX;

static int MIN_POSSIBLE = INT_MIN;

typedef struct _AVLTreeNode AVLTree;

AVLTree* AVLTreeCreate(void);

void AVLTreeDestroy(AVLTree** pRoot);

// AVLTree properties

int AVLTreeIsEmpty(const AVLTree* root);

int AVLTreeIsBST(const AVLTree* root);

int AVLTreeEquals(const AVLTree* root1, const AVLTree* root2);

int AVLTreeMirrors(const AVLTree* root1, const AVLTree* root2);

// ...

// Getters

int AVLTreeGetNumberOfNodes(const AVLTree* root);

int AVLTreeGetHeight(const AVLTree* root);

ItemType AVLTreeGetMin(const AVLTree* root);

ItemType AVLTreeGetMax(const AVLTree* root);

AVLTree* AVLTreeGetPointerToMinNode(const AVLTree* root);

AVLTree* AVLTreeGetPointerToMaxNode(const AVLTree* root);

// ...

// Recursive Traversals

void AVLTreeTraverseInPREOrder(AVLTree* root, void (*function)(ItemType* p));

void AVLTreeTraverseINOrder(AVLTree* root, void (*function)(ItemType* p));

void AVLTreeTraverseInPOSTOrder(AVLTree* root, void (*function)(ItemType* p));

// Traversals using a QUEUE or STACK

void AVLTreeTraverseLevelByLevelWithQUEUE(AVLTree* root,
                                          void (*function)(ItemType* p));

void AVLTreeTraverseInPREOrderWithSTACK(AVLTree* root,
                                        void (*function)(ItemType* p));

void AVLTreeTraverseINOrderWithSTACK(AVLTree* root,
                                     void (*function)(ItemType* p));

// ...

// Operations with items

int AVLTreeContains(const AVLTree* root, const ItemType item);

int AVLTreeAdd(AVLTree** pRoot, const ItemType item);

int AVLTreeRemove(AVLTree** pRoot, const ItemType item);

// ...

// DISPLAYING on the console

void AVLTreeDisplay(const AVLTree* root, void (*printFunc)(ItemType* p));

// Storing and reading from a FILE

int AVLTreeStoreInFile(const AVLTree* root, char* fileName, int fileType);

AVLTree* AVLTreeGetFromFile(char* fileName, int fileType);

// JUST FOR RUNNING EXAMPLES - REMOVE FROM THE INTERFACE

AVLTree* createExampleAVLTree(unsigned int n);

AVLTree* createAnotherExampleAVLTree(void);

#endif  // _AVL_Tree_
