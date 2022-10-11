""" Exercicio 09.
Analise e execute o programa dates.py. Faça as correçoes indicadas abaixo.

a.  A funçao isLeapYear deveria indicar quando um ano é bissexto, mas esta errada.
    Corrija-a. Um ano e bissexto se for multiplo de 4, com exceçao dos fins de seculo
    (multiplos de 100), que so sao bissextos se forem multiplos de 400. Por exemplo:
    1980, 1984, 2004 foram bissextos; 1800 e 1900 foram anos comuns, mas 2000 foi bissexto.

b.  A funçao monthDays, para determinar o numero de dias de um mes, tambem esta errada.
    Quando o mes e fevereiro, invoque a funçao anterior para determinar se o ano e
    bissexto e devolva 29 dias nesse caso.

c.  Corrija a funçao nextDay para devolver o dia seguinte corretamente.
"""

# This function checks if year is a leap year.
# It is wrong: 1900 was a common year!
from operator import contains


def isLeapYear(year):
    if year % 100 == 0:
        return year % 400 == 0
    return year%4 == 0

# This function has a semantic error: February in a leap year should return 29!
# Correct it.
def monthDays(year, month):
    MONTHDAYS = (0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
        # This tuple contains the days in each month (on a common year).
        # For example: MONTHDAYS[3] is the number of days in March.
    days = MONTHDAYS[month]
    if isLeapYear(year) and month == 2:
        days += 1
    return days

# This is wrong, too.
def nextDay(year, month, day):
    months31 = (1, 3, 5, 7, 8, 10)
    months30 = (4, 6, 9, 11)
    if (month, day) == (12, 31):
        year += 1
        month = 1
        day = 1
    elif contains(months31, month) and day == 31:
        month += 1
        day = 1
    elif contains(months30, month) and day == 30:
        month += 1
        day = 1
    elif month == 2 and day >= 28:
        if isLeapYear(year) and day == 29:
            day = 1
            month += 1
        if not isLeapYear(year) and day == 28:
            day = 1
            month += 1
    else:
        day += 1

    return year, month, day


# This is the main function
def main():
    print("Was", 2017, "a leap year?", isLeapYear(2017))    # False?
    print("Was", 2016, "a leap year?", isLeapYear(2016))    # True?
    print("Was", 2000, "a leap year?", isLeapYear(2000))    # True?
    print("Was", 1900, "a leap year?", isLeapYear(1900))    # False?
    
    print("January 2017 had", monthDays(2017, 1), "days")   # 31?
    print("February 2017 had", monthDays(2017, 2), "days")  # 28?
    print("February 2016 had", monthDays(2016, 2), "days")  # 29?
    print("February 2000 had", monthDays(2000, 2), "days")  # 29?
    print("February 1900 had", monthDays(1900, 2), "days")  # 28?
    
    y, m, d = nextDay(2017, 1, 30)
    print(y, m, d)    # 2017 1 31 ?
    y, m, d = nextDay(2017, 1, 31)
    print(y, m, d)    # 2017 2 1 ?
    y, m, d = nextDay(2017, 2, 28)
    print(y, m, d)    # 2017 3 1 ?
    y, m, d = nextDay(2016, 2, 29)
    print(y, m, d)    # 2016 3 1 ?
    y, m, d = nextDay(2017, 12, 31)
    print(y, m, d)    # 2018 1 1 ?

# call the main function
main()
