/* TAD que permite obter todos os subconjuntos de um conjunto de n elementos */
/* Ficheiro de interface binarycounter.h           J. Madeira --- 2010/06/02 */

#include <stdio.h>
#include <stdlib.h>

int* createBinCounter(int size);
/* Cria o contador binário com dimensão size, inicializado a zeros */

void copyBinCounter(int* original, int* copy, int size);
/* Copia o contador actual */

void destroyBinCounter(int** binCounter);
/* Destroi o contador */

void printBinCounter(int* binCounter, int size);
/* Imprime o contador */

int increaseBinCounter(int* binCounter, int size);
/* Incrementa o contador */
