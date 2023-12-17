//
// Algoritmos e Estruturas de Dados --- 2023/2024
//
// Joaquim Madeira, April 2020, November 2023
//
// Adapted from Tomás Oliveira e Silva, AED, September 2015
//
// SORTED LIST implementation based on an linked list
//

// ***************** COMPLETAR AS FUNCOES !!! *******************

#include "SortedList.h"

#include <assert.h>
#include <stdlib.h>

struct _ListNode {
  void* item;
  struct _ListNode* next;
};

struct _SortedList {
  int size;                   // current List size
  struct _ListNode* head;     // the head of the List
  struct _ListNode* tail;     // the tail of the List
  struct _ListNode* current;  // the current node
  int currentPos;             // the current node index
  compFunc compare;
};

List* ListCreate(compFunc compF) {
  List* l = (List*)malloc(sizeof(List));
  assert(l != NULL);

  l->size = 0;
  l->head = NULL;
  l->tail = NULL;
  l->current = NULL;
  l->currentPos = -1;  // Default: before the head of the list
  l->compare = compF;
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

  struct _ListNode* p = l->head;
  struct _ListNode* aux;

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

unsigned int ListGetSize(const List* l) {
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

void* ListGetCurrentItem(const List* l) {
  assert(l != NULL && l->current != NULL);
  return l->current->item;
}

void ListModifyCurrentValue(const List* l, void* p) {
  assert(l != NULL && l->current != NULL);
  l->current->item = p;
}

// The move and search functions return 0 on success and -1 on failure (on
// success the current node is changed, on failure it is not changed)

// Search
//
// starting at the current node, search for the first node with a value of *p
// on failure the current node is not changed
//
int ListSearch(List* l, const void* p) {
  int i = (l->currentPos < 0) ? 0 : l->currentPos;

  struct _ListNode* sn = (l->currentPos < 0) ? l->head : l->current;

  while (i < l->size && l->compare(p, sn->item) > 0) {
    i++;
    sn = sn->next;
  }

  if (i == l->size) {
    return -1;
  }  // failure

  if (l->compare(p, sn->item) < 0) {
    return -1;
  }  // failure

  l->current = sn;
  l->currentPos = i;

  return 0;  // success
}

// Move to functions

int ListMove(List* l, int newPos) {
  if (newPos < -1 || newPos > l->size) {
    return -1;
  }  // failure

  if (newPos == -1 || newPos == l->size) {
    l->current = NULL;
  } else if (newPos == 0) {
    l->current = l->head;
  } else if (newPos == l->size - 1) {
    l->current = l->tail;
  } else {
    if (l->currentPos == -1 || l->currentPos == l->size ||
        newPos < l->currentPos) {
      l->current = l->head;
      l->currentPos = 0;
    }

    for (int i = l->currentPos; i < newPos; i++) {
      l->current = l->current->next;
    }
  }
  l->currentPos = newPos;

  return 0;  // success
}

int ListMoveToNext(List* l) { return ListMove(l, l->currentPos + 1); }

int ListMoveToPrevious(List* l) { return ListMove(l, l->currentPos - 1); }

int ListMoveToHead(List* l) { return ListMove(l, 0); }

int ListMoveToTail(List* l) { return ListMove(l, l->size - 1); }

// Insert function

//
// insert a node
// the current node is not changed
// return 0 on success
// return -1 on failure
//
int ListInsert(List* l, void* p) {
  struct _ListNode* sn = (struct _ListNode*)malloc(sizeof(struct _ListNode));
  assert(sn != NULL);
  sn->item = p;
  sn->next = NULL;

  // Empty list
  if (l->size == 0) {
    l->head = l->tail = sn;
    l->size = 1;
    return 0;
  }

  // Search

  int i = 0;
  struct _ListNode* prev = NULL;
  struct _ListNode* aux = l->head;

  while (i < l->size && l->compare(p, aux->item) > 0) {
    i++;
    prev = aux;
    aux = aux->next;
  }

  if (i == l->size) {  // Append at the tail
    l->tail->next = sn;
    l->tail = sn;
    l->size++;
    return 0;
  }

  if (l->compare(p, aux->item) == 0) {  // Already exists !!
    free(sn);
    return -1;
  }  // failure

  if (i == 0) {  // Append at the head
    sn->next = l->head;
    l->head = sn;
    l->size++;
    if (l->currentPos >= 0) {
      l->currentPos++;
    }
    return 0;
  }

  sn->next = aux;
  prev->next = sn;
  l->size++;
  if (l->currentPos >= i) {
    l->currentPos++;
  }

  return 0;
}

// Remove functions

//
// remove the head of the list and make its next node the new head
// if the current node is the head, it is replaced by its next node
//
void* ListRemoveHead(List* l) {
  assert(l->size > 0);
  if (l->current == l->head) {
    l->current = l->head->next;
    l->currentPos++;
  }
  if (l->size == 1) {
    void* p = l->head->item;
    free(l->head);
    l->head = NULL;
    l->tail = NULL;
    l->size = 0;
    if (l->currentPos > 0) l->currentPos = 0;
    return p;
  } else {
    struct _ListNode* sn = l->head->next;
    void* p = l->head->item;
    free(l->head);
    l->head = sn;
    if (l->currentPos > 0) l->currentPos--;
    l->size--;
    return p;
  }
}

//
// remove the tail of the list and make its previous node the new tail
// if the current node is the tail, it is replaced by it by its next node
//
void* ListRemoveTail(List* l) {
  assert(l->size > 0);
  if (l->current == l->tail) {
    l->current = NULL;
    l->currentPos++;
  }
  if (l->size == 1) {
    void* p = l->head->item;
    free(l->head);
    l->head = NULL;
    l->tail = NULL;
    l->current = NULL;
    if (l->currentPos > 0) l->currentPos = 0;
    l->size = 0;
    return p;
  } else {
    struct _ListNode* sn = l->head;
    while (sn->next != l->tail) sn = sn->next;
    sn->next = NULL;
    void* p = l->tail->item;
    free(l->tail);
    l->tail = sn;
    if (l->currentPos == l->size) l->currentPos--;
    l->size--;
    return p;
  }
}

//
// remove the current node and make its next node the current node
//
void* ListRemoveCurrent(List* l) {
  assert(l->currentPos >= 0 && l->currentPos < l->size);
  if (l->currentPos == 0)
    return ListRemoveHead(l);
  else if (l->currentPos == l->size - 1)
    return ListRemoveTail(l);
  else {
    struct _ListNode* sn = l->head;
    while (sn->next != l->current) sn = sn->next;
    sn->next = l->current->next;
    void* p = l->current->item;
    free(l->current);
    l->current = sn->next;
    l->size--;
    return p;
  }
}

// Tests

void ListTestInvariants(const List* l) {
  assert(l->size >= 0);
  if (l->size == 0)
    assert(l->head == NULL && l->tail == NULL);
  else
    assert(l->head != NULL && l->tail != NULL);
  if (l->size == 1) assert(l->head == l->tail);
  assert(-1 <= l->currentPos && l->currentPos <= l->size);
  if (l->currentPos == -1 || l->currentPos == l->size)
    assert(l->current == NULL);
  struct _ListNode* sn = l->head;
  for (int i = 0; i < l->size; i++) {
    if (i == l->size - 1)
      assert(sn == l->tail && sn->next == NULL);
    else
      assert(sn->next != NULL);
    if (i == l->currentPos) assert(sn == l->current);
    sn = sn->next;
  }
}
