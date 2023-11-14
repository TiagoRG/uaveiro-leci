//
// Algoritmos e Estruturas de Dados - 2023/2024 - 1o semestre
//
// Joaquim Madeira, April 2020
//
// Pointers queue (First In First Out) implementation based on a circular
// array of pointers to void
//

#include "PointersQueue.h"

#include <assert.h>
#include <stdlib.h>

struct _PointersQueue {
  int max_size;  // maximum Queue size
  int cur_size;  // current Queue size
  int head;
  int tail;
  void** data;  // the Queue data (pointers stored in an array)
};

// PRIVATE auxiliary function

static int increment_index(const Queue* q, int i) {
  return (i + 1 < q->max_size) ? i + 1 : 0;
}

// PUBLIC functions

Queue* QueueCreate(int size) {
  assert(size >= 10 && size <= 1000000);
  Queue* q = (Queue*)malloc(sizeof(Queue));
  if (q == NULL) return NULL;

  q->max_size = size;
  q->cur_size = 0;

  q->head = 1;  // cur_size = tail - head + 1
  q->tail = 0;

  q->data = (void**)malloc(size * sizeof(void*));
  if (q->data == NULL) {
    free(q);
    return NULL;
  }
  return q;
}

void QueueDestroy(Queue** p) {
  assert(*p != NULL);
  Queue* q = *p;
  free(q->data);
  free(q);
  *p = NULL;
}

void QueueClear(Queue* q) {
  q->cur_size = 0;
  q->head = 1;  // cur_size = tail - head + 1
  q->tail = 0;
}

int QueueSize(const Queue* q) { return q->cur_size; }

int QueueIsFull(const Queue* q) { return (q->cur_size == q->max_size) ? 1 : 0; }

int QueueIsEmpty(const Queue* q) { return (q->cur_size == 0) ? 1 : 0; }

void* QueuePeek(const Queue* q) {
  assert(q->cur_size > 0);
  return q->data[q->head];
}

void QueueEnqueue(Queue* q, void* p) {
  assert(q->cur_size < q->max_size);
  q->tail = increment_index(q, q->tail);
  q->data[q->tail] = p;
  q->cur_size++;
}

void* QueueDequeue(Queue* q) {
  assert(q->cur_size > 0);
  int old_head = q->head;
  q->head = increment_index(q, q->head);
  q->cur_size--;
  return q->data[old_head];
}
