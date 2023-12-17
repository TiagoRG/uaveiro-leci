//
// Algoritmos e Estruturas de Dados --- 2023/2024
//
// Joaquim Madeira, May 2020, November 2023
//
// Simple Hash Table for COUNTING WORDS using Open Addressing
// Keys are STRINGS - Values are INTEGERS
//

#include "HashTable.h"

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct _HashTableBin {
  char* key;
  unsigned int value;
  int isDeleted;
  int isFree;
};

struct _HashTableHeader {
  unsigned int size;
  unsigned int numActive;
  unsigned int numUsed;
  hashFunction hashF;
  probeFunction probeF;
  int resizeIsEnabled;
  struct _HashTableBin* table;
};

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

unsigned int linearProbing(unsigned int index, unsigned int i,
                           unsigned int size) {
  return (index + i) % size;
}

//
// Simple quadratic probing --- improve !!
//
unsigned int quadraticProbing(unsigned int index, unsigned int i,
                              unsigned int size) {
  return (index + i * i) % size;
}

// TAD Functions

HashTable* HashTableCreate(unsigned int size, hashFunction hashF,
                           probeFunction probeF, int resizeIsEnabled) {
  assert(size > 0);
  HashTable* hTable = (HashTable*)malloc(sizeof(struct _HashTableHeader));
  assert(hTable != NULL);
  hTable->table =
      (struct _HashTableBin*)malloc(size * sizeof(struct _HashTableBin));
  assert(hTable->table != NULL);

  hTable->size = size;
  hTable->numActive = 0;
  hTable->numUsed = 0;
  hTable->hashF = hashF;
  hTable->probeF = probeF;
  hTable->resizeIsEnabled = resizeIsEnabled;

  for (unsigned int i = 0; i < size; i++) {
    hTable->table[i].key = NULL;
    hTable->table[i].value = 0;
    hTable->table[i].isFree = 1;
    hTable->table[i].isDeleted = 0;
  }

  return hTable;
}

void HashTableDestroy(HashTable** p) {
  assert(*p != NULL);
  HashTable* t = *p;

  for (unsigned int i = 0; i < t->size; i++) {
    if (t->table[i].key) free(t->table[i].key);
  }
  free(t->table);
  free(t);
  *p = NULL;
}

static void _resizeHashTable(HashTable* hashT, unsigned int newSize) {
  if (newSize == 0) return;

  // Do this is a better way: choose a near prime
  if (newSize % 2 == 0) {
    newSize++;
  }

  struct _HashTableBin* oldBinsArray = hashT->table;
  unsigned int oldSize = hashT->size;

  hashT->table =
      (struct _HashTableBin*)malloc(newSize * sizeof(struct _HashTableBin));
  assert(hashT->table != NULL);

  for (unsigned int i = 0; i < newSize; i++) {
    hashT->table[i].key = NULL;
    hashT->table[i].value = 0;
    hashT->table[i].isFree = 1;
    hashT->table[i].isDeleted = 0;
  }

  hashT->size = newSize;
  hashT->numActive = 0;
  hashT->numUsed = 0;

  // Copy items to the new array of bins
  // Disable resizing while copying

  hashT->resizeIsEnabled = 0;

  for (unsigned int i = 0; i < oldSize; i++) {
    if (oldBinsArray[i].isFree || oldBinsArray[i].isDeleted) {
      continue;
    }
    HashTablePut(hashT, oldBinsArray[i].key, oldBinsArray[i].value);
  }

  hashT->resizeIsEnabled = 1;

  // Free the old array

  for (unsigned int i = 0; i < oldSize; i++) {
    if (oldBinsArray[i].key) free(oldBinsArray[i].key);
  }
  free(oldBinsArray);
}

// HashTable properties

int HashTableIsEmpty(const HashTable* hashT) { return hashT->numActive == 0; }

int HashTableIsFull(const HashTable* hashT) {
  return hashT->numUsed == hashT->size;
}

// Getters

int HashTableGetNumberOfItems(const HashTable* hashT) {
  return hashT->numActive;
}

double HashTableGetLoadFactor(const HashTable* hashT) {
  return (double)hashT->numActive / (double)hashT->size;
}

// Operations with items

//
// If the key belongs to the table, return the corresponding index
// If not, return one (next) available index or -1, if the table is full
//
static int _searchHashTable(const HashTable* hashT, const char* key) {
  unsigned int hashKey = hashT->hashF(key);

  unsigned int index;
  struct _HashTableBin* bin;

  for (unsigned int i = 0; i < hashT->size; i++) {
    index = hashT->probeF(hashKey, i, hashT->size);

    bin = &(hashT->table[index]);

    if (bin->isFree) {
      // Not in the table !
      return index;
    }

    if ((bin->isDeleted == 0) && (strcmp(bin->key, key) == 0)) {
      // Found it !
      return index;
    }
  }

  // SHOULD NEVER HAPPEN !!
  return -1;
}

int HashTableContains(const HashTable* hashT, const char* key) {
  int result = _searchHashTable(hashT, key);
  if (result == -1 || hashT->table[result].isFree == 1) {
    // NOT FOUND
    return 0;
  }
  return 1;
}

unsigned int HashTableGet(const HashTable* hashT, const char* key) {
  int index = _searchHashTable(hashT, key);
  if (index == -1 || hashT->table[index].isFree == 1) {
    // NOT FOUND
    return 0;
  }

  return hashT->table[index].value;
}

int HashTablePut(HashTable* hashT, const char* key, unsigned int value) {
  int result = _searchHashTable(hashT, key);

  if (result == -1) {
    // NO PLACE AVAILABLE
    return 0;
  }

  if (hashT->table[result].isFree == 0) {
    // ALREADY IN THE TABLE
    return 0;
  }

  // Does NOT BELONG to the table
  // See if it can be stored earlier in the chain, by starting again
  // Losing some efficiency here

  unsigned int hashKey = hashT->hashF(key);

  unsigned int index;
  struct _HashTableBin* bin;

  for (unsigned int i = 0; i < hashT->size; i++) {
    index = hashT->probeF(hashKey, i, hashT->size);

    bin = &(hashT->table[index]);

    if (bin->isFree) {
      bin->key = (char*)malloc(sizeof(char) * (1 + strlen(key)));
      strcpy(bin->key, key);
      bin->value = value;
      bin->isFree = bin->isDeleted = 0;

      hashT->numActive++;
      hashT->numUsed++;

      if (hashT->resizeIsEnabled && HashTableGetLoadFactor(hashT) > 0.5) {
        _resizeHashTable(hashT, hashT->size * 2);
      }

      return 1;
    }

    if (bin->isDeleted) {
      bin->key = (char*)malloc(sizeof(char) * (1 + strlen(key)));
      strcpy(bin->key, key);
      bin->value = value;
      bin->isFree = bin->isDeleted = 0;

      hashT->numActive++;

      return 1;
    }
  }

  return 0;
}

//
// Increment the current value
// If key does not exist, insert it with a count of 1
//
int HashTableIncrement(HashTable* hashT, const char* key) {
  int index = _searchHashTable(hashT, key);
  if (index == -1) {
    // NOT FOUND AND NO PLACE --- SHOULD NOT HAPPEN !!
    return 0;
  }

  if (hashT->table[index].isFree == 0) {
    // ALREADY IN THE TABLE - INCREMENT

    hashT->table[index].value++;
    return 1;
  }

  // NEW KEY - INSERT
  // LOOSING SOME EFFICIENCY HERE

  return HashTablePut(hashT, key, 1);
}

int HashTableReplace(const HashTable* hashT, const char* key,
                     unsigned int value) {
  int index = _searchHashTable(hashT, key);
  if (index == -1 || hashT->table[index].isFree == 1) {
    // NOT FOUND
    return 0;
  }

  hashT->table[index].value = value;

  return 1;
}

int HashTableRemove(HashTable* hashT, const char* key) {
  int index = _searchHashTable(hashT, key);
  if (index == -1 || hashT->table[index].isFree == 1) {
    // NOT FOUND
    return 0;
  }

  // Mark as deleted to keep the chain

  hashT->table[index].isDeleted = 1;
  hashT->numActive--;

  free(hashT->table[index].key);
  hashT->table[index].key = NULL;
  hashT->table[index].value = 0;

  if (hashT->resizeIsEnabled && HashTableGetLoadFactor(hashT) < 0.125) {
    _resizeHashTable(hashT, hashT->size / 2);
  }

  return 1;
}

// DISPLAYING on the console

void HashTableDisplay(const HashTable* hashT) {
  printf("---\n");
  printf("size = %2d | Used = %2d | Active = %2d\n", hashT->size,
         hashT->numUsed, hashT->numActive);
  for (unsigned int i = 0; i < hashT->size; i++) {
    printf("%3d - ", i);
    printf("Free = %d - ", hashT->table[i].isFree);
    printf("Deleted = %d - ", hashT->table[i].isDeleted);
    if (hashT->table[i].key) {
      unsigned int hashValue = hashT->hashF(hashT->table[i].key);
      unsigned int firstIndex = hashValue % hashT->size;
      printf("Hash = %4d, 1st index = %3d, (%s, %d)\n", hashValue, firstIndex,
             hashT->table[i].key, hashT->table[i].value);
    } else
      printf("\n");
  }
  printf("---\n");
}

void HashTableDisplayItems(const HashTable* hashT) {
  printf("NUMBER OF ITEMS = %d\n\n", hashT->numActive);
  for (unsigned int i = 0; i < hashT->size; i++) {
    if (hashT->table[i].key) {
      printf("%s %d\n", hashT->table[i].key, hashT->table[i].value);
    }
  }
}
