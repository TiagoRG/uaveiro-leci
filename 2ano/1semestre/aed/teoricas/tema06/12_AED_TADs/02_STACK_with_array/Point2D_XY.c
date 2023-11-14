//
// Algoritmos e Estruturas de Dados - 2023/2024 - 1o semestre
//
// J. Madeira - Outubro 2023
//

#include <assert.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#include "Point2D.h"

// Conversion factors
#define RAD_TO_DEG 57.2957795
#define DEG_TO_RAD 0.0174532925

struct _Point2D {
  double x;
  double y;
};

Point2D* Point2D_CreateXY(double x, double y) {
  Point2D* p = malloc(sizeof(Point2D));
  assert(p != NULL);
  p->x = x;
  p->y = y;

  return p;
}

Point2D* Point2D_CreatePolar(double radius, double angle_deg) {
  assert(radius >= 0.0);
  assert((angle_deg >= 0.0) && (angle_deg < 360.0));

  double angle_radians = angle_deg * DEG_TO_RAD;

  Point2D* p = malloc(sizeof(Point2D));
  assert(p != NULL);
  p->x = radius * cos(angle_radians);
  p->y = radius * sin(angle_radians);

  return p;
}

void Point2D_Destroy(Point2D** p) {
  assert(*p != NULL);
  free(*p);
  *p = NULL;
}

double Point2D_GetX(const Point2D* p) {
  assert(p != NULL);
  return p->x;
}

double Point2D_GetY(const Point2D* p) {
  assert(p != NULL);
  return p->y;
}

double Point2D_GetRadius(const Point2D* p) {
  assert(p != NULL);

  return sqrt(p->x * p->x + p->y * p->y);
}

// Returns angle in range [0, 360[ degrees
double Point2D_GetAngleDegrees(const Point2D* p) {
  assert(p != NULL);

  // In range [-180, 180]
  double angle = atan2(p->y, p->x) * RAD_TO_DEG;

  // In range [0, 360]
  angle = (angle >= 0) ? angle : angle + 360.0;

  if (angle == 360.0) {
    angle = 0.0;
  }

  return angle;
}

int Point2D_IsEqual(const Point2D* p1, const Point2D* p2) {
  assert((p1 != NULL) && (p2 != NULL));

  return (p1->x == p2->x) && (p1->y == p2->y);
}

int Point2D_IsDifferent(const Point2D* p1, const Point2D* p2) {
  assert((p1 != NULL) && (p2 != NULL));

  return (p1->x != p2->x) || (p1->y != p2->y);
}

void Point2D_DisplayXY(const Point2D* p) {
  assert(p != NULL);

  printf("( %.3f, %.3f )", p->x, p->y);
}

void Point2D_DisplayPolar(const Point2D* p) {
  assert(p != NULL);

  printf("( %.3f, %.3f )", Point2D_GetRadius(p), Point2D_GetAngleDegrees(p));
}

double Point2D_Distance(const Point2D* p1, const Point2D* p2) {
  assert((p1 != NULL) && (p2 != NULL));

  double deltaX = p2->x - p1->x;
  double deltaY = p2->y - p1->y;

  return sqrt(deltaX * deltaX + deltaY * deltaY);
}

Point2D* Point2D_MidPoint(const Point2D* p1, const Point2D* p2) {
  assert((p1 != NULL) && (p2 != NULL));

  double mid_point_x = (p1->x + p2->x) / 2.0;
  double mid_point_y = (p1->y + p2->y) / 2.0;

  return Point2D_CreateXY(mid_point_x, mid_point_y);
}
