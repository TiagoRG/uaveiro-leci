//
// Algoritmos e Estruturas de Dados --- 2023/2024
//
// Joaquim Madeira / Joao Manuel Rodrigues
//
// Binary Max Heap storing pointers to generic items.
//

#ifndef _MAX_HEAP_
#define _MAX_HEAP_

// The type for MaxHeap instances
typedef struct _Heap MaxHeap;

// The type for item comparator functions
typedef int (*compFunc)(const void* p1, const void* p2);

// The type for item printer functions
typedef void (*printFunc)(void* p);

// CREATE/DESTROY

MaxHeap* MaxHeapCreate(int capacity, compFunc compF, printFunc printF);

void MaxHeapDestroy(MaxHeap** pph);

// GETTERS

int MaxHeapCapacity(const MaxHeap* ph);

int MaxHeapSize(const MaxHeap* ph);

int MaxHeapIsEmpty(const MaxHeap* ph);

int MaxHeapIsFull(const MaxHeap* ph);

void* MaxHeapGetMax(const MaxHeap* ph);

// MODIFY

void MaxHeapInsert(MaxHeap* ph, void* item);

void MaxHeapRemoveMax(MaxHeap* ph);

// CHECK/VIEW

int MaxHeapCheck(const MaxHeap* ph);

void MaxHeapView(const MaxHeap* ph);

#endif
