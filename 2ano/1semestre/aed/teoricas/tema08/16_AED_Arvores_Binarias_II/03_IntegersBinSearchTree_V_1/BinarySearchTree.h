//
// Joaquim Madeira, Algoritmos e Estruturas de Dados, November 2023
//
// Adapted from an old example...
//
// Integers Binary Search Tree --- INCOMPLETE
//

#ifndef _BINARY_SEARCH_Tree_
#define _BINARY_SEARCH_Tree_

#include <limits.h>

// JUST storing integers
typedef int ItemType;

static int NO_ITEM = INT_MAX;

static int MIN_POSSIBLE = INT_MIN;

typedef struct _BSTreeNode BSTree;

BSTree* BSTreeCreate(void);

void BSTreeDestroy(BSTree** pRoot);

// BSTree properties

int BSTreeIsEmpty(const BSTree* root);

int BSTreeIsBST(const BSTree* root);

int BSTreeEquals(const BSTree* root1, const BSTree* root2);

int BSTreeMirrors(const BSTree* root1, const BSTree* root2);

// ...

// Getters

int BSTreeGetNumberOfNodes(const BSTree* root);

int BSTreeGetHeight(const BSTree* root);

ItemType BSTreeGetMin(const BSTree* root);

ItemType BSTreeGetMax(const BSTree* root);

BSTree* BSTreeGetPointerToMinNode(const BSTree* root);

BSTree* BSTreeGetPointerToMaxNode(const BSTree* root);

// ...

// Recursive Traversals

void BSTreeTraverseInPREOrder(BSTree* root, void (*function)(ItemType* p));

void BSTreeTraverseINOrder(BSTree* root, void (*function)(ItemType* p));

void BSTreeTraverseInPOSTOrder(BSTree* root, void (*function)(ItemType* p));

// Traversals using a QUEUE or STACK

void BSTreeTraverseLevelByLevelWithQUEUE(BSTree* root,
                                         void (*function)(ItemType* p));

void BSTreeTraverseInPREOrderWithSTACK(BSTree* root,
                                       void (*function)(ItemType* p));

void BSTreeTraverseINOrderWithSTACK(BSTree* root,
                                    void (*function)(ItemType* p));

// ...

// Operations with items

int BSTreeContains(const BSTree* root, const ItemType item);

int BSTreeAdd(BSTree** pRoot, const ItemType item);

int BSTreeRemove(BSTree** pRoot, const ItemType item);

// ...

// Storing and reading from a FILE

int BSTreeStoreInFile(const BSTree* root, char* fileName, int fileType);

BSTree* BSTreeGetFromFile(char* fileName, int fileType);

// JUST FOR RUNNING EXAMPLES - REMOVE FROM THE INTERFACE

BSTree* createExampleBSTree(unsigned int n);

BSTree* createAnotherExampleBSTree(void);

#endif  // _BINARY_SEARCH_Tree_
