def isLeapYear(year):
    # Garante que apenas os anos de mudança de século múltiplos de 400
    # devolvem True
    if year % 100 == 0:
        return year % 400 == 0
    # Devolve True para o resto dos anos múltiplos de 4
    return year%4 == 0


def monthDays(year, month):
    assert month > 0
    
    MONTHDAYS = (0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
    days = MONTHDAYS[month]
    # Só adicionado mais 1 dia se o mẽs for fevereiro (2) e o
    # ano for bissexto
    if isLeapYear(year) and month == 2:
        days += 1
    return days


def nextDay(year, month, day):
    assert 13 > month > 0
    assert day > 0
    
    MONTHS31DAYS = (1, 3, 5, 7, 8, 10)
    MONTHS30DAYS = (4, 6, 9, 11)

    # Último dia do ano
    if (month, day) == (12, 31):
        year += 1
        month = 1
        day = 1
    
    # Último dia de um mês segundo os casos:
    # > Mês de 31 dias e é o dia 31 do mês
    # > Mês de 30 dias e é o dia 30 do mês
    # > Fevereiro e (
    #    o ano é bissexto e é o dia 29 do mês
    # ou o ano não é bissexto e é o dia 28 do mês
    # )
    elif ( (month in MONTHS31DAYS and day == 31)
        or (month in MONTHS30DAYS and day == 30)
        or (month == 2 and (
            (isLeapYear(year) and day == 29)
        or  (not isLeapYear(year) and day == 28)
        ))):
        month += 1
        day = 1
    
    # Dia comum
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
if __name__ == "__main__":
    main()