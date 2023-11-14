//
// Joaquim Madeira, AlgC, April 2020
//
// Adapted from Tomás Oliveira e Silva, AED, September 2015
//
// Pointers queue (First In First Out) implementation based on an array
// of pointers
//

#include "PointersQueue.h"

#include <assert.h>
#include <stdlib.h>

struct _PointersQueueNode {
  void* data;
  struct _PointersQueueNode* next;
};

struct _PointersQueue {
  int size;                         // current Queue size
  struct _PointersQueueNode* head;  // the head of the Queue
  struct _PointersQueueNode* tail;  // the tail of the Queue
};

Queue* QueueCreate(void) {
  Queue* q = (Queue*)malloc(sizeof(Queue));
  assert(q != NULL);

  q->size = 0;
  q->head = NULL;
  q->tail = NULL;
  return q;
}

void QueueDestroy(Queue** p) {
  assert(*p != NULL);
  Queue* q = *p;

  QueueClear(q);

  free(q);
  *p = NULL;
}

void QueueClear(Queue* q) {
  assert(q != NULL);

  struct _PointersQueueNode* p = q->head;
  struct _PointersQueueNode* aux;

  while (p != NULL) {
    aux = p;
    p = aux->next;
    free(aux);
  }

  q->size = 0;
  q->head = NULL;
  q->tail = NULL;
}

int QueueSize(const Queue* q) {
  assert(q != NULL);
  return q->size;
}

int QueueIsEmpty(const Queue* q) {
  assert(q != NULL);
  return (q->size == 0) ? 1 : 0;
}

void* QueuePeek(const Queue* q) {
  assert(q != NULL && q->size > 0);
  return q->head->data;
}

void QueueEnqueue(Queue* q, void* p) {
  assert(q != NULL);

  struct _PointersQueueNode* aux;
  aux = (struct _PointersQueueNode*)malloc(sizeof(*aux));
  assert(aux != NULL);

  aux->data = p;
  aux->next = NULL;

  q->size++;

  if (q->size == 1) {
    q->head = aux;
    q->tail = aux;
  } else {
    q->tail->next = aux;
    q->tail = aux;
  }
}

void* QueueDequeue(Queue* q) {
  assert(q != NULL && q->size > 0);

  struct _PointersQueueNode* aux = q->head;
  void* p = aux->data;

  q->size--;

  if (q->size == 0) {
    q->head = NULL;
    q->tail = NULL;
  } else {
    q->head = aux->next;
  }

  free(aux);

  return p;
}
