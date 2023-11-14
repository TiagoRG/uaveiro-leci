//
// Joaquim Madeira, Algoritmos e Estruturas de Dados, November 2023
//
// Adapted from an old example...
//
// Integers Binary Tree --- SECOND VERSION --- INCOMPLETE
//

#ifndef _INTEGERS_BINTREE_
#define _INTEGERS_BINTREE_

// JUST storing integers
typedef int ItemType;

static int NO_ITEM = -999;

typedef struct _TreeNode Tree;

Tree* TreeCreate(void);

void TreeDestroy(Tree** pRoot);

// Tree properties

int TreeIsEmpty(const Tree* root);

int TreeEquals(const Tree* root1, const Tree* root2);

int TreeMirrors(const Tree* root1, const Tree* root2);

// ...

// Getters

int TreeGetNumberOfNodes(const Tree* root);

int TreeGetHeight(const Tree* root);

ItemType TreeGetMin(const Tree* root);

ItemType TreeGetMax(const Tree* root);

Tree* TreeGetPointerToMinNode(const Tree* root);

Tree* TreeGetPointerToMaxNode(const Tree* root);

// ...

// Recursive Traversals

void TreeTraverseInPREOrder(Tree* root, void (*function)(ItemType* p));

void TreeTraverseINOrder(Tree* root, void (*function)(ItemType* p));

void TreeTraverseInPOSTOrder(Tree* root, void (*function)(ItemType* p));

// Traversals using a QUEUE or STACK

void TreeTraverseLevelByLevelWithQUEUE(Tree* root,
                                       void (*function)(ItemType* p));

void TreeTraverseInPREOrderWithSTACK(Tree* root, void (*function)(ItemType* p));

void TreeTraverseINOrderWithSTACK(Tree* root, void (*function)(ItemType* p));

// ...

// Operations with items

int TreeContains(const Tree* root, const ItemType item);

int TreeAdd(Tree** pRoot, const ItemType item);

int TreeRemove(Tree** pRoot, const ItemType item);

// ...

// Storing and reading from a FILE

int TreeStoreInFile(const Tree* root, char* fileName, int fileType);

Tree* TreeGetFromFile(char* fileName, int fileType);

// JUST FOR RUNNING EXAMPLES - REMOVE FROM THE INTERFACE

Tree* createExampleTree(void);

Tree* createAnotherExampleTree(void);

#endif  // _INTEGERS_BINTREE_
