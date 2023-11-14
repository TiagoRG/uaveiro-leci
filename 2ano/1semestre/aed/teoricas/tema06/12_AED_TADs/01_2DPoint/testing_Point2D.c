//
// Algoritmos e Estruturas de Dados - 2023/2024 - 1o semestre
//
// J. Madeira - Outubro 2023
//

#include <assert.h>
#include <stdio.h>

#include "Point2D.h"

int main(void) {
  // Some vey simple tests
  // TO DO : more thorough tests
  // TO DO : check for floating point precision errors, when comparing for
  //         equality

  // XY (0,0)
  Point2D* point_1 = Point2D_CreateXY(0.0, 0.0);
  assert(Point2D_GetX(point_1) == 0.0);
  assert(Point2D_GetY(point_1) == 0.0);
  assert(Point2D_GetRadius(point_1) == 0.0);
  assert(Point2D_GetAngleDegrees(point_1) == 0.0);

  // XY (1,0)
  Point2D* point_2 = Point2D_CreateXY(1.0, 0.0);
  assert(Point2D_GetX(point_2) == 1.0);
  assert(Point2D_GetY(point_2) == 0.0);
  assert(Point2D_GetRadius(point_2) == 1.0);
  assert(Point2D_GetAngleDegrees(point_2) == 0.0);

  // Polar: radius = 2.0 and angle = 0 degrees
  Point2D* point_3 = Point2D_CreatePolar(2.0, 0.0);
  assert(Point2D_GetX(point_3) == 2.0);
  assert(Point2D_GetY(point_3) == 0.0);
  assert(Point2D_GetRadius(point_3) == 2.0);
  assert(Point2D_GetAngleDegrees(point_3) == 0.0);

  // Comparing
  assert(Point2D_IsEqual(point_2, point_2));
  assert(!Point2D_IsEqual(point_2, point_3));
  assert(!Point2D_IsDifferent(point_2, point_2));
  assert(Point2D_IsDifferent(point_2, point_3));

  // Distance
  assert(Point2D_Distance(point_1, point_2) == 1.0);

  // Mid-point
  Point2D* midpoint = Point2D_MidPoint(point_1, point_2);
  assert(Point2D_GetX(midpoint) == 0.5);
  assert(Point2D_GetY(midpoint) == 0.0);

  // Destroy points
  Point2D_Destroy(&point_1);
  assert(point_1 == NULL);
  Point2D_Destroy(&point_2);
  Point2D_Destroy(&point_3);
  Point2D_Destroy(&midpoint);

  return 0;
}