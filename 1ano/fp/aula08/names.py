def main():
    with open('names.txt', 'r') as f:
        names = f.read().split('\n')
        namesDict = {surname: set([name.split(' ')[0] for name in names[1:] if surname in name])
                     for surname in set([name.split(' ')[-1] for name in names[1:] if name != ''])}

        printNames(namesDict)


def printNames(namesDict):
    for surname in namesDict:
        print(f"{surname} : {namesDict[surname]}")


if __name__ == "__main__":
    main()
