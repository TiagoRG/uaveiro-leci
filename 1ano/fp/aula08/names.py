def main():
    with open('names.txt', 'r') as f:
        names = f.read().split('\n')
        surnames = set([name.split(' ')[-1] for name in names[1:]])
        namesDict = {}
        for surname in surnames:
            namesDict[surname] = set([name.split(' ')[0] for name in names[1:] if surname in name and surname != ''])

        del namesDict['']
        printNames(namesDict)


def printNames(namesDict):
    for surname in namesDict:
        print(f"{surname} : {namesDict[surname]}")


if __name__ == "__main__":
    main()
