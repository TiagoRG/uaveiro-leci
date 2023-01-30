def main():
    floatList = inputFloatList()
    print(floatList)
    print()

    # Tem de dar print a '4'
    print(countLower([1321, 143, 1432, 512, 43, 153, 143613], 1000))
    print()

    # Tem de dar print a 43, 143613
    print(minmax([1321, 143, 1432, 512, 43, 153, 143613]))
    print()

    #
    mix()


def inputFloatList(inputMsg='>>> '):
    returnList = []
    while True:
        inpt = input(inputMsg)
        if inpt == '':
            return returnList
        try:
            returnList.append(float(inpt))
        except ValueError:
            continue


def countLower(lst, v):
    return len([lst[i] for i in range(len(lst)) if lst[i] < v])


def minmax(lst):
    mx = lst[0]
    mn = lst[0]
    for n in lst:
        if n > mx:
            mx = n
        if n < mn:
            mn = n
    return mn, mx


# Alinea d)
def mix():
    lst = inputFloatList()
    mn_mx = minmax(lst)
    med = (mn_mx[0] + mn_mx[1]) / 2
    count = countLower(lst, med)
    print(count)


if __name__ == "__main__":
    main()
