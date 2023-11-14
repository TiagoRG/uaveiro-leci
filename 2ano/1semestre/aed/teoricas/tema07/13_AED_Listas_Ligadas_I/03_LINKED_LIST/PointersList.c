//
// Joaquim Madeira, AlgC, April 2020
//
// Adapted from Tomás Oliveira e Silva, AED, September 2015
//
// Pointers LIST implementation based on an linked list
//

// ***************** COMPLETAR AS FUNCOES !!! *******************

#include "PointersList.h"

#include <assert.h>
#include <stdlib.h>

struct _PointersListNode {
  void* data;
  struct _PointersListNode* next;
};

struct _PointersList {
  int size;                           // current List size
  struct _PointersListNode* head;     // the head of the List
  struct _PointersListNode* tail;     // the tail of the List
  struct _PointersListNode* current;  // the current node
  int currentPos;
};

List* ListCreate(void) {
  List* l = (List*)malloc(sizeof(List));
  assert(l != NULL);

  l->size = 0;
  l->head = NULL;
  l->tail = NULL;
  l->current = NULL;
  l->currentPos = -1;  // Default: before the head of the list
  return l;
}

void ListDestroy(List** p) {
  assert(*p != NULL);
  List* l = *p;

  ListClear(l);

  free(l);
  *p = NULL;
}

void ListClear(List* l) {
  assert(l != NULL);

  struct _PointersListNode* p = l->head;
  struct _PointersListNode* aux;

  while (p != NULL) {
    aux = p;
    p = aux->next;
    free(aux);
  }

  l->size = 0;
  l->head = NULL;
  l->tail = NULL;
  l->current = NULL;
  l->currentPos = -1;  // Default: before the head of the list
}

int ListGetSize(const List* l) {
  assert(l != NULL);
  return l->size;
}

int ListIsEmpty(const List* l) {
  assert(l != NULL);
  return (l->size == 0) ? 1 : 0;
}

// Current node functions

int ListGetCurrentIndex(const List* l) {
  assert(l != NULL);
  return l->currentPos;
}

void* ListGetCurrentValue(const List* l) {
  assert(l != NULL && l->current != NULL);
  return l->current->data;
}

void ListModifyCurrentValue(const List* l, void* p) {}

// The move and search functions return 0 on success and -1 on failure (on
// success the current node is changed, on failure it is not changed)

// Search

int ListSearchFromCurrent(const List* l, void* p) { return -1; }

// Move to functions

int ListMove(List* l, int newPos) { return -1; }

int ListMoveToNext(List* l) { return -1; }

int ListMoveToPrevious(List* l) { return -1; }

int ListMoveToHead(List* l) { return -1; }

int ListMoveToTail(List* l) { return -1; }

// Insert functions

void ListInsertBeforeHead(List* l, void* p) {}

void ListInsertAfterTail(List* l, void* p) {}

void ListInsertAfterCurrent(List* l, void* p) {}

void ListInsertBeforeCurrent(List* l, void* p) {}

// Remove functions

void ListRemoveHead(List* l) {
  assert(l != NULL && l->size > 0);

  struct _PointersListNode* aux = l->head;

  if (l->current == l->head) {
    l->current = l->head->next;
    if (l->current == NULL) {
      l->currentPos = -1;
    } else {
      l->currentPos++;
    }
  }

  l->size--;

  if (l->size == 0) {
    l->head = NULL;
    l->tail = NULL;
  } else {
    struct _PointersListNode* next = l->head->next;
    l->head = next;
  }

  free(aux);
}

void ListRemoveTail(List* l) {}

void ListRemoveCurrent(List* l) {}

void ListRemoveNext(List* l) {}

// Tests

void ListTestInvariants(const List* l) {}
