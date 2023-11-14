//
// Algoritmos e Estruturas de Dados - 2023/2024 - 1o semestre
//
// J. Madeira - April 2020
//
// Pointers stack (First In Last Out) implementation based on an array of
// pointers to void
//

#include "PointersStack.h"

#include <assert.h>
#include <stdlib.h>

struct _PointersStack {
  int max_size;  // maximum stack size
  int cur_size;  // current stack size
  void** data;   // the stack data (pointers stored in an array)
};

Stack* StackCreate(int size) {
  assert(size >= 10 && size <= 1000000);
  Stack* s = (Stack*)malloc(sizeof(Stack));
  if (s == NULL) return NULL;
  s->max_size = size;
  s->cur_size = 0;
  s->data = (void**)malloc(size * sizeof(void*));
  if (s->data == NULL) {
    free(s);
    return NULL;
  }
  return s;
}

void StackDestroy(Stack** p) {
  assert(*p != NULL);
  Stack* s = *p;
  free(s->data);
  free(s);
  *p = NULL;
}

void StackClear(Stack* s) { s->cur_size = 0; }

int StackSize(const Stack* s) { return s->cur_size; }

int StackIsFull(const Stack* s) { return (s->cur_size == s->max_size) ? 1 : 0; }

int StackIsEmpty(const Stack* s) { return (s->cur_size == 0) ? 1 : 0; }

void* StackPeek(const Stack* s) {
  assert(s->cur_size > 0);
  return s->data[s->cur_size - 1];
}

void StackPush(Stack* s, void* p) {
  assert(s->cur_size < s->max_size);
  s->data[s->cur_size++] = p;
}

void* StackPop(Stack* s) {
  assert(s->cur_size > 0);
  return s->data[--(s->cur_size)];
}
