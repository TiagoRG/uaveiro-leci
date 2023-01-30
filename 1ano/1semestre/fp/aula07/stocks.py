import re

# Constantes para indexar os tuplos:
NAME, DATE, OPEN, MAX, MIN, CLOSE, VOLUME = 0, 1, 2, 3, 4, 5, 6


def main():
    lst = loadStockFile("datafiles/nasdaq.csv")
    # Show just first and last tuples:
    print("first:", lst[1])
    print("last:", lst[-1])

    print("a) totVol=", totalVolume(lst))

    print("b) maxVal=", maxValorization(lst))

    stocksDic = stocksByDateByName(lst)
    print("c) CSCO@11:", stocksDic['2020-10-12']['CSCO'])
    print("c) AMZN@22:", stocksDic['2020-10-22']['AMZN'])

    # Parte incompleta
    port = {'NFLX': 100, 'CSCO': 80}
    print("d) portfolio@01:", portfolioValue(stocksDic, port, "2020-10-01"))
    print("d) portfolio@30:", portfolioValue(stocksDic, port, "2020-10-30"))


def loadStockFile(filename):
    lst = []
    with open(filename) as f:
        for line in f:
            parts = line.strip().split('\t')
            name = parts[NAME]
            date = parts[DATE]
            tup = (name, date, float(parts[OPEN]), float(parts[MAX]),
                   float(parts[MIN]), float(parts[CLOSE]), int(parts[VOLUME]))
            lst.append(tup)
    return lst


def totalVolume(lst):
    totVol = {}
    # Complete ...
    for tup in lst:
        if tup[NAME] not in totVol:
            totVol[tup[NAME]] = tup[VOLUME]
        else:
            totVol[tup[NAME]] += tup[VOLUME]

    return totVol


def maxValorization(lst):
    vMax = {}
    # Complete ...
    for data in range(1, 31):
        maxDiario = 0
        maxDiarioComp = "No data"
        for tup in lst:
            pat = r"0[1-9]"
            dia = tup[DATE].split('-')[2]
            if re.match(pat, dia):
                dia = dia[1]
            if data == int(dia):
                maxcomp = tup[OPEN] / tup[CLOSE] * 100
                if maxcomp > maxDiario:
                    maxDiario = maxcomp
                    maxDiarioComp = tup[NAME]

        if maxDiarioComp != "No data":
            vMax[data] = (maxDiarioComp, f"{maxDiario:.1f}%")

    return vMax


def stocksByDateByName(lst):
    dic = {}
    # Complete ...
    for tup in lst:
        if tup[DATE] not in dic:
            dic[tup[DATE]] = {}
        dic[tup[DATE]][tup[NAME]] = tup

    return dic


def portfolioValue(stocks, portfolio, date):
    assert date in stocks
    val = 0.0
    # Complete ...
    for comp in portfolio:
        val += portfolio[comp] * stocks[date][comp][CLOSE]

    return val


if __name__ == "__main__":
    main()
