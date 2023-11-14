
//
// Algoritmos e Estruturas de Dados - 2023/2024 - 1o semestre
//
// J. Madeira - October 2023
//
// Creating a STACK of 2D Points using the Point2D abstract type
//
// Pointers STACK : usage example
//

#include <stdio.h>
#include <stdlib.h>

#include "Point2D.h"
#include "PointersStack.h"

int main(void) {
  // Some 2D points
  Point2D* point_1 = Point2D_CreateXY(0.0, 0.0);
  Point2D* point_2 = Point2D_CreateXY(1.0, 0.0);
  Point2D* point_3 = Point2D_CreatePolar(2.0, 0.0);

  // Creating an empty STACK
  Stack* s = StackCreate(20);

  // Pushing the points onto the STACK
  StackPush(s, point_1);
  StackPush(s, point_2);
  StackPush(s, point_3);

  while (!StackIsEmpty(s)) {
    Point2D* p = (Point2D*)StackPop(s);
    Point2D_DisplayXY(p);
    printf("\n");
  }

  // Destroy the empty stack
  StackDestroy(&s);

  // Destroy the points
  Point2D_Destroy(&point_1);
  Point2D_Destroy(&point_2);
  Point2D_Destroy(&point_3);

  return 0;
}
