//
// Algoritmos e Estruturas de Dados --- 2023/2024
//
// Joaquim Madeira, Joao Manuel Rodrigues - June 2021, Nov 2023
//
// Graph - Using a list of adjacency lists representation
//

#ifndef _GRAPH_
#define _GRAPH_

#include <stdio.h>

typedef struct _GraphHeader Graph;

Graph* GraphCreate(unsigned int numVertices, int isDigraph, int isWeighted);

Graph* GraphCreateComplete(unsigned int numVertices, int isDigraph);

void GraphDestroy(Graph** p);

Graph* GraphCopy(const Graph* g);

Graph* GraphFromFile(FILE* f);

// Graph

int GraphIsDigraph(const Graph* g);

int GraphIsComplete(const Graph* g);

int GraphIsWeighted(const Graph* g);

unsigned int GraphGetNumVertices(const Graph* g);

unsigned int GraphGetNumEdges(const Graph* g);

//
// For a graph
//
double GraphGetAverageDegree(const Graph* g);

//
// For a graph
//
unsigned int GraphGetMaxDegree(const Graph* g);

//
// For a digraph
//
unsigned int GraphGetMaxOutDegree(const Graph* g);

// Vertices

unsigned int* GraphGetAdjacentsTo(const Graph* g, unsigned int v);

// Vertices distances
double* GraphGetDistancesToAdjacents(const Graph* g, unsigned int v);

//
// For a graph
//
unsigned int GraphGetVertexDegree(Graph* g, unsigned int v);

//
// For a digraph
//
unsigned int GraphGetVertexOutDegree(Graph* g, unsigned int v);

//
// For a digraph
//
unsigned int GraphGetVertexInDegree(Graph* g, unsigned int v);

// Edges

int GraphAddEdge(Graph* g, unsigned int v, unsigned int w);

int GraphAddWeightedEdge(Graph* g, unsigned int v, unsigned int w,
                         double weight);

int GraphRemoveEdge(Graph* g, unsigned int v, unsigned int w);

// CHECKING

int GraphCheckInvariants(const Graph* g);

// DISPLAYING on the console

void GraphDisplay(const Graph* g);

void GraphListAdjacents(const Graph* g, unsigned int v);

#endif  // _GRAPH_
