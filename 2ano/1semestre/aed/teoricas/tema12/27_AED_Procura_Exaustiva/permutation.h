/* TAD que permite obter todas as permutacoes de um conjunto de n elementos */
/* Ficheiro de interface permutation.h            J. Madeira --- 2010/06/02 */

#include <stdio.h>
#include <stdlib.h>

int* createFirstPermutation(int n);
/* Cria o array de permutacoes com dimensao n, sendo a primeira permutacao
 * 123456...n */

void copyPermutation(int* original, int* copy, int n);
/* Copia a permutacao actual */

void destroyPermutation(int** p);
/* Destroi o array de permutacoes */

void printPermutation(int* p, int n);
/* Imprime a permutacao actual */

int nextPermutation(int* v, int n);
/* Cria a permutacao seguinte */
