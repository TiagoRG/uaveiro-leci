//
// Algoritmos e Estruturas de Dados --- 2023/2024
//
// Joaquim Madeira, May 2020, November 2023
//
// Simple Hash Table using Open Addressing
// Key and Value are STRINGS - To simplify the example
//

#ifndef _HASH_TABLE_
#define _HASH_TABLE_

typedef struct _HashTableHeader HashTable;

typedef unsigned int (*hashFunction)(const char* key);

typedef unsigned int (*probeFunction)(unsigned int index, unsigned int i,
                                      unsigned int size);

// Auxiliary functions for experimenting

unsigned int hash1(const char* key);
unsigned int hash2(const char* key);

unsigned int linearProbing(unsigned int index, unsigned int i,
                           unsigned int size);
unsigned int quadraticProbing(unsigned int index, unsigned int i,
                              unsigned int size);

// TAD Functions

HashTable* HashTableCreate(unsigned int capacity, hashFunction hashF,
                           probeFunction probeF, int resizeIsEnabled);

void HashTableDestroy(HashTable** p);

// HashTable properties

int HashTableIsEmpty(const HashTable* hashT);

int HashTableIsFull(const HashTable* hashT);

// Getters

int HashTableGetNumberOfItems(const HashTable* hashT);

double HashTableGetLoadFactor(const HashTable* hashT);

// Operations with items

int HashTableContains(const HashTable* hashT, const char* key);

char* HashTableGet(const HashTable* hashT, const char* key);

int HashTablePut(HashTable* hashT, const char* key, const char* value);

int HashTableReplace(const HashTable* hashT, const char* key,
                     const char* value);

int HashTableRemove(HashTable* hashT, const char* key);

// DISPLAYING on the console

void HashTableDisplay(const HashTable* hashT);

#endif  // _HASH_TABLE_
