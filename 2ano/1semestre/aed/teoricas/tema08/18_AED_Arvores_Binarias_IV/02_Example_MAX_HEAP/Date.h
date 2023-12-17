
// JMR, 2021

#ifndef _DATE_
#define _DATE_

#include <inttypes.h>

struct _date {
  uint16_t year;
  uint8_t month;
  uint8_t day;
};

// The Date type. (To be used in clients.)
typedef struct _date Date;

// Constants
extern const Date DateMIN;
extern const Date DateMAX;

// Macros to select date format
#define YMD 0
#define DMY 1
#define MDY 2

Date* DateCreate(int yy, int mm, int dd);

void DateDestroy(Date** pd);

int DateIsValid(int yy, int mm, int dd);

int DateDaysInMonth(int yy, int mm);

int DateIsLeapYear(int yy);

char* DateFormat(const Date* d, int FMT);

Date* DateParse1(const char* str, int FMT);

int DateParse(Date* d, const char* str, int FMT);

int DateCompare(const Date* a, const Date* b);

void DateIncr(Date* d);

void DateDecr(Date* d);

#endif  //_DATE_
