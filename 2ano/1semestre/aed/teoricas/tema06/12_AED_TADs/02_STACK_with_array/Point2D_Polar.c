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

// PI
#define PI 3.1415926536

// radius >= 0
// angle in range [0, 2 * PI[
struct _Point2D {
  double radius;
  double angle;
};

Point2D* Point2D_CreateXY(double x, double y) {
  Point2D* p = malloc(sizeof(Point2D));
  assert(p != NULL);

  p->radius = sqrt(x * x + y * y);

  if (y == 0.0) {
    if (x >= 0.0) {
      p->angle = 0.0;
    } else {
      p->angle = PI;
    }
  } else if (x == 0.0) {
    if (y > 0.0) {
      p->angle = PI / 2.0;
    } else {
      p->angle = 3.0 * PI / 4.0;
    }
  } else {
    // In range ]-PI,PI[
    double angle = atan2(y, x);
    p->angle = (angle >= 0.0) ? angle : angle + PI;
  }

  return p;
}

Point2D* Point2D_CreatePolar(double radius, double angle_deg) {
  assert(radius >= 0.0);
  assert((angle_deg >= 0.0) && (angle_deg < 360.0));

  Point2D* p = malloc(sizeof(Point2D));
  assert(p != NULL);
  p->radius = radius;
  p->angle = angle_deg * DEG_TO_RAD;

  return p;
}

void Point2D_Destroy(Point2D** p) {
  assert(*p != NULL);
  free(*p);
  *p = NULL;
}

double Point2D_GetX(const Point2D* p) {
  assert(p != NULL);
  return p->radius * cos(p->angle);
}

double Point2D_GetY(const Point2D* p) {
  assert(p != NULL);
  return p->radius * sin(p->angle);
}

double Point2D_GetRadius(const Point2D* p) {
  assert(p != NULL);

  return p->radius;
}

double Point2D_GetAngleDegrees(const Point2D* p) {
  assert(p != NULL);

  return p->angle * RAD_TO_DEG;
}

int Point2D_IsEqual(const Point2D* p1, const Point2D* p2) {
  assert((p1 != NULL) && (p2 != NULL));

  return (p1->radius == p2->radius) && (p1->angle == p2->angle);
}

int Point2D_IsDifferent(const Point2D* p1, const Point2D* p2) {
  assert((p1 != NULL) && (p2 != NULL));

  return (p1->radius != p2->radius) || (p1->angle != p2->angle);
}

void Point2D_DisplayXY(const Point2D* p) {
  assert(p != NULL);

  printf("( %.3f, %.3f )", Point2D_GetX(p), Point2D_GetY(p));
}

void Point2D_DisplayPolar(const Point2D* p) {
  assert(p != NULL);

  printf("( %.3f, %.3f )", p->radius, p->angle);
}

double Point2D_Distance(const Point2D* p1, const Point2D* p2) {
  assert((p1 != NULL) && (p2 != NULL));

  double deltaX = Point2D_GetX(p2) - Point2D_GetX(p1);
  double deltaY = Point2D_GetY(p2) - Point2D_GetY(p1);

  return sqrt(deltaX * deltaX + deltaY * deltaY);
}

Point2D* Point2D_MidPoint(const Point2D* p1, const Point2D* p2) {
  assert((p1 != NULL) && (p2 != NULL));

  double new_X = (Point2D_GetX(p1) + Point2D_GetX(p2)) / 2.0;
  double new_Y = (Point2D_GetY(p1) + Point2D_GetY(p2)) / 2.0;

  Point2D* mid_point = Point2D_CreateXY(new_X, new_Y);

  return mid_point;
}
