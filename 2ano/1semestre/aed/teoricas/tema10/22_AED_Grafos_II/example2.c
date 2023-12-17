//
// Algoritmos e Estruturas de Dados --- 2023/2024
//
// Joaquim Madeira, Joao Manuel Rodrigues - May 2020, Nov 2023
//
// Graph EXAMPLE
//

#include "Graph.h"
#include "GraphDFSRec.h"

int main(void) {
  // Graph
  Graph* g01 = GraphCreate(6, 0, 0);

  GraphAddEdge(g01, 0, 5);
  GraphAddEdge(g01, 2, 4);
  GraphAddEdge(g01, 2, 3);
  GraphAddEdge(g01, 1, 2);
  GraphAddEdge(g01, 0, 1);
  GraphAddEdge(g01, 3, 4);
  GraphAddEdge(g01, 3, 5);
  GraphAddEdge(g01, 0, 2);

  GraphDisplay(g01);

  // DFS traversal starting at vertex 0
  GraphDFSRec* traversal = GraphDFSRecExecute(g01, 0);

  printf("Path from 0 to 5: ");
  GraphDFSRecShowPath(traversal, 5);
  printf("\n");

  GraphDFSRecDestroy(&traversal);

  GraphDestroy(&g01);

  // Digraph
  g01 = GraphCreate(6, 1, 0);

  GraphAddEdge(g01, 0, 5);
  GraphAddEdge(g01, 2, 4);
  GraphAddEdge(g01, 2, 3);
  GraphAddEdge(g01, 1, 2);
  GraphAddEdge(g01, 0, 1);
  GraphAddEdge(g01, 3, 4);
  GraphAddEdge(g01, 3, 5);
  GraphAddEdge(g01, 0, 2);

  GraphDisplay(g01);

  // DFS traversal starting at vertex 1
  traversal = GraphDFSRecExecute(g01, 1);

  printf("Path from 1 to 5: ");
  GraphDFSRecShowPath(traversal, 5);
  printf("\n");

  GraphDFSRecDestroy(&traversal);

  GraphDestroy(&g01);

  return 0;
}
