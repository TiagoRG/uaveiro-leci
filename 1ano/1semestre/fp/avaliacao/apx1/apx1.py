def isLeapYear(year):
    return year % 400 == 0 if year % 100 == 0 else year % 4 == 0


def monthDays(year, month):
    assert month > 0

    MONTHDAYS = (0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
    days = MONTHDAYS[month]

    return days + 1 if (isLeapYear(year) and month == 2) else days


def nextDay(year, month, day):
    if not dateIsValid(year, month, day): return

    # Verifica se é o último dia do ano
    if (month, day) == (12, 31):
        year += 1
        month = 1
        day = 1

    # Verifica se é o último dia do mês
    elif (monthDays(year, month) == day):
        month += 1
        day = 1

    # Dia comum
    else:
        day += 1

    return year, month, day


def dateIsValid(year, month, day):
    return False if (month > 12 or month <= 0) or (day > monthDays(year, month) or day <= 0) else True


def previousDay(year, month, day):
    if not dateIsValid(year, month, day): return

    # Primeiro dia do ano
    if (month, day) == (1, 1):
        year -= 1
        month = 12
        day = 31

    # Primeiro dia do mês (sem ser janeiro)
    elif day == 1:
        day = monthDays(year, month - 1)
        month -= 1

    # Dia comum
    else:
        day -= 1

    return year, month, day
