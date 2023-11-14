//
// Joaquim Madeira, April 2020
//
// Pointers LIST implementation based on a linked list
//

#ifndef _POINTERS_LIST_

#define _POINTERS_LIST_

typedef struct _PointersList List;

List* ListCreate(void);

void ListDestroy(List** p);

void ListClear(List* l);

int ListGetSize(const List* l);

int ListIsEmpty(const List* l);

// Current node functions

int ListGetCurrentIndex(const List* l);

void* ListGetCurrentValue(const List* l);

void ListModifyCurrentValue(const List* l, void* p);

// The move and search functions return 0 on success and -1 on failure (on
// success the current node is changed, on failure it is not changed)

// Search

int ListSearchFromCurrent(const List* l, void* p);

// Move to functions

int ListMove(List* l, int newPos);

int ListMoveToNext(List* l);

int ListMoveToPrevious(List* l);

int ListMoveToHead(List* l);

int ListMoveToTail(List* l);

// Insert functions

void ListInsertBeforeHead(List* l, void* p);

void ListInsertAfterTail(List* l, void* p);

void ListInsertAfterCurrent(List* l, void* p);

void ListInsertBeforeCurrent(List* l, void* p);

// Remove functions

void ListRemoveHead(List* l);

void ListRemoveTail(List* l);

void ListRemoveCurrent(List* l);

void ListRemoveNext(List* l);

// Tests

void ListTestInvariants(const List* l);

#endif  // _POINTERS_LIST_