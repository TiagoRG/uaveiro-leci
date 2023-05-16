# Example: finding and counting leap years
# JMR 2019

def isLeapYear(year):
    return year % 4 == 0 and year % 100 != 0 or year % 400 == 0


def printLeapYears(year1, year2):
    """Print all leap years in range [year1, year2[."""
    for year in listLeapYears(year1, year2):
        print(year)


def numLeapYears(year1, year2):
    """Return the number of leap years in range [year1, year2[."""
    return len(listLeapYears(year1, year2))


def listLeapYears(year1, year2):
    """Return a list of leap years in range [year1, year2[."""
    # (We'll get back to lists later in the course.)
    lst = []
    for year in range(year1, year2):
        if isLeapYear(year):
            lst.append(year)

    return lst


# MAIN PROGRAM:
def main():
    printLeapYears(1870, 1921)

    x = numLeapYears(1679, 2079)
    print("In [1679, 2079[ there are", x, "leap years")

    print(listLeapYears(1970, 2002))


if __name__ == "__main__":
    main()
