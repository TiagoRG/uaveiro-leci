//
// Algoritmos e Estruturas de Dados - 2023/2024 - 1o semestre
//
// J. Madeira - Outubro 2023
//

#ifndef _POINT2D_H_
#define _POINT2D_H_

typedef struct _Point2D Point2D;

Point2D* Point2D_CreateXY(double x, double y);
Point2D* Point2D_CreatePolar(double radius, double angle_deg);

void Point2D_Destroy(Point2D** p);

double Point2D_GetX(const Point2D* p);
double Point2D_GetY(const Point2D* p);

double Point2D_GetRadius(const Point2D* p);
double Point2D_GetAngleDegrees(const Point2D* p);

int Point2D_IsEqual(const Point2D* p1, const Point2D* p2);
int Point2D_IsDifferent(const Point2D* p1, const Point2D* p2);

void Point2D_DisplayXY(const Point2D* p);
void Point2D_DisplayPolar(const Point2D* p);

double Point2D_Distance(const Point2D* p1, const Point2D* p2);

Point2D* Point2D_MidPoint(const Point2D* p1, const Point2D* p2);

#endif
