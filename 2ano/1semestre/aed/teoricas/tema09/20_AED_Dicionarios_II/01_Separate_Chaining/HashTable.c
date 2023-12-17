//
// Algoritmos e Estruturas de Dados --- 2023/2024
//
// Joaquim Madeira, May 2020, November 2023
//
// Simple Hash Table using Separate Chaining
// Key and Value are STRINGS - To simplify the example
//

#include "HashTable.h"

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "SortedList.h"

struct _HashTableBin {
  char* key;
  char* value;
};

struct _HashTableHeader {
  unsigned int size;
  unsigned int numBins;
  hashFunction hashF;
  List** table;
};

// The comparator: to compare a key (*p1) with the key on the list bin (*p2)

int comparator(const void* p1, const void* p2) {
  return strcmp(((struct _HashTableBin*)p1)->key,
                ((struct _HashTableBin*)p2)->key);
}

// Auxiliary functions for experimenting

unsigned int hash1(const char* key) {
  assert(strlen(key) > 0);
  return key[0];
}

unsigned int hash2(const char* key) {
  assert(strlen(key) > 0);
  if (strlen(key) == 1) return key[0];
  return key[0] + key[1];
}

// TAD Functions

HashTable* HashTableCreate(unsigned int size, hashFunction hashF) {
  assert(size > 0);
  HashTable* hTable = (HashTable*)malloc(sizeof(struct _HashTableHeader));
  assert(hTable != NULL);
  hTable->table = (List**)malloc(size * sizeof(List*));
  assert(hTable->table != NULL);

  hTable->size = size;
  hTable->numBins = 0;
  hTable->hashF = hashF;

  for (unsigned int i = 0; i < size; i++) {
    hTable->table[i] = ListCreate(comparator);
  }

  return hTable;
}

void HashTableDestroy(HashTable** p) {
  assert(*p != NULL);
  HashTable* t = *p;

  // For each chain
  for (unsigned int i = 0; i < t->size; i++) {
    List* l = t->table[i];
    // Free the HT bins of each list
    while (ListIsEmpty(l) == 0) {
      struct _HashTableBin* bin = ListRemoveHead(l);
      free(bin->key);
      free(bin->value);
      free(bin);
    }
    // Destroy the list header
    ListDestroy(&(t->table[i]));
  }

  free(t->table);
  free(t);
  *p = NULL;
}

// HashTable properties

int HashTableIsEmpty(const HashTable* hashT) { return hashT->numBins == 0; }

// Getters

unsigned int HashTableGetNumberOfItems(const HashTable* hashT) {
  return hashT->numBins;
}

double HashTableGetLoadFactor(const HashTable* hashT) {
  return (double)hashT->numBins / (double)hashT->size;
}

// Operations with items

//
// Search for the key
// If found, the list current node is updated
//
static int _searchKeyInList(List* l, char* key) {
  if (ListIsEmpty(l)) {
    return 0;
  }

  // Needed for the comparator
  // Shallow copy of the key: just the pointer
  struct _HashTableBin searched;
  searched.key = key;

  ListMoveToHead(l);
  return ListSearch(l, &searched) != -1;
}

int HashTableContains(const HashTable* hashT, char* key) {
  unsigned int index = hashT->hashF(key) % hashT->size;
  List* l = hashT->table[index];

  return _searchKeyInList(l, key);
}

char* HashTableGet(const HashTable* hashT, char* key) {
  unsigned int index = hashT->hashF(key) % hashT->size;
  List* l = hashT->table[index];

  // Search and update current, if found
  if (_searchKeyInList(l, key) == 0) {
    return NULL;
  }

  struct _HashTableBin* bin = ListGetCurrentItem(l);

  char* result = (char*)malloc(sizeof(char) * (1 + strlen(bin->value)));
  strcpy(result, bin->value);

  return result;
}

int HashTablePut(HashTable* hashT, char* key, char* value) {
  unsigned int index = hashT->hashF(key) % hashT->size;
  List* l = hashT->table[index];

  if (_searchKeyInList(l, key) == 1) {
    // FOUND, cannot be added to the table
    return 0;
  }

  // Does NOT BELONG to the table
  // Insert a new bin in the list

  struct _HashTableBin* bin = (struct _HashTableBin*)malloc(sizeof(*bin));
  bin->key = (char*)malloc(sizeof(char) * (1 + strlen(key)));
  strcpy(bin->key, key);
  bin->value = (char*)malloc(sizeof(char) * (1 + strlen(value)));
  strcpy(bin->value, value);

  ListInsert(l, bin);
  hashT->numBins++;

  return 1;
}

int HashTableReplace(const HashTable* hashT, char* key, char* value) {
  unsigned int index = hashT->hashF(key) % hashT->size;
  List* l = hashT->table[index];

  // Search and update current, if found
  if (_searchKeyInList(l, key) == 0) {
    return 0;
  }

  struct _HashTableBin* bin = ListGetCurrentItem(l);

  free(bin->value);
  bin->value = (char*)malloc(sizeof(char) * (1 + strlen(value)));
  strcpy(bin->value, value);

  return 1;
}

int HashTableRemove(HashTable* hashT, char* key) {
  unsigned int index = hashT->hashF(key) % hashT->size;
  List* l = hashT->table[index];

  // Search and update current, if found
  if (_searchKeyInList(l, key) == 0) {
    return 0;
  }

  // Get rid of the bin
  struct _HashTableBin* bin = ListGetCurrentItem(l);
  free(bin->key);
  free(bin->value);
  free(bin);

  // Get rid of the list node
  ListRemoveCurrent(l);
  hashT->numBins--;

  return 1;
}

// DISPLAYING on the console

void HashTableDisplay(const HashTable* hashT) {
  printf("---\n");
  printf("Size = %2d | Active = %2d\n", hashT->size, hashT->numBins);
  for (unsigned int i = 0; i < hashT->size; i++) {
    printf("%3d - ", i);
    if (ListIsEmpty(hashT->table[i])) {
      printf("\n");
    } else {
      printf("\n");
      List* l = hashT->table[i];
      ListMoveToHead(l);
      for (int i = 0; i < ListGetSize(l); i++) {
        struct _HashTableBin* bin = ListGetCurrentItem(l);
        unsigned int hashValue = hashT->hashF(bin->key);
        printf("      Hash = %4d, (%s, %s)\n", hashValue, bin->key, bin->value);
        ListMoveToNext(l);
      }
    }
  }
  printf("---\n");
}
