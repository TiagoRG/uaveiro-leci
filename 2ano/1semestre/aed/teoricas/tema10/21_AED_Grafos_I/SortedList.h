//
// Algoritmos e Estruturas de Dados --- 2023/2024
//
// Joaquim Madeira, April 2020, November 2023
//
// Adapted from Tomás Oliveira e Silva, AED, September 2015
//
// SORTED LIST implementation based on a linked list
//

#ifndef _SORTED_LIST_
#define _SORTED_LIST_

typedef struct _SortedList List;
typedef int (*compFunc)(const void* p1, const void* p2);

List* ListCreate(compFunc compF);

void ListDestroy(List** p);

void ListClear(List* l);

unsigned int ListGetSize(const List* l);

int ListIsEmpty(const List* l);

// Current node functions

int ListGetCurrentIndex(const List* l);

void* ListGetCurrentItem(const List* l);

void ListModifyCurrentItem(const List* l, void* p);

// The move and search functions return 0 on success and -1 on failure (on
// success the current node is changed, on failure it is not changed)

// Search

int ListSearch(List* l, const void* p);

// Move to

int ListMove(List* l, int newPos);

int ListMoveToNext(List* l);

int ListMoveToPrevious(List* l);

int ListMoveToHead(List* l);

int ListMoveToTail(List* l);

// Insert

int ListInsert(List* l, void* p);

// Remove

void* ListRemoveHead(List* l);

void* ListRemoveTail(List* l);

void* ListRemoveCurrent(List* l);

// Tests

void ListTestInvariants(const List* l);

#endif  // _SORTED_LIST_