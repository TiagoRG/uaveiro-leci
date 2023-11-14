//
// Joaquim Madeira, AlgC, April 2020
//
// Adapted from Tomás Oliveira e Silva, AED, September 2015
//
// Pointers stack (First In Last Out) implementation based on an array
// of pointers
//

#include "PointersStack.h"

#include <assert.h>
#include <stdlib.h>

struct _PointersStackNode {
  void* data;
  struct _PointersStackNode* next;
};

struct _PointersStack {
  int cur_size;                    // current stack size
  struct _PointersStackNode* top;  // the node on the top of the stack
};

Stack* StackCreate(void) {
  Stack* s = (Stack*)malloc(sizeof(Stack));
  assert(s != NULL);

  s->cur_size = 0;
  s->top = NULL;
  return s;
}

void StackDestroy(Stack** p) {
  assert(*p != NULL);
  Stack* s = *p;

  StackClear(s);

  free(s);
  *p = NULL;
}

void StackClear(Stack* s) {
  assert(s != NULL);

  struct _PointersStackNode* p = s->top;
  struct _PointersStackNode* aux;

  while (p != NULL) {
    aux = p;
    p = aux->next;
    free(aux);
  }

  s->cur_size = 0;
  s->top = NULL;
}

int StackSize(const Stack* s) {
  assert(s != NULL);
  return s->cur_size;
}

int StackIsEmpty(const Stack* s) {
  assert(s != NULL);
  return (s->cur_size == 0) ? 1 : 0;
}

void* StackPeek(const Stack* s) {
  assert(s != NULL && s->cur_size > 0);
  return s->top->data;
}

void StackPush(Stack* s, void* p) {
  assert(s != NULL);

  struct _PointersStackNode* aux;
  aux = (struct _PointersStackNode*)malloc(sizeof(*aux));
  assert(aux != NULL);

  aux->data = p;
  aux->next = s->top;

  s->top = aux;

  s->cur_size++;
}

void* StackPop(Stack* s) {
  assert(s != NULL && s->cur_size > 0);

  struct _PointersStackNode* aux = s->top;
  s->top = aux->next;
  s->cur_size--;

  void* p = aux->data;

  free(aux);

  return p;
}
