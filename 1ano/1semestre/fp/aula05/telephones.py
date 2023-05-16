# Convert a telephone number into corresponding name, if on list.
# (If not on list, just return the number itself.)


def telToName(tel, telList, nameList):
    # your code here
    for index, t in enumerate(telList):
        if t == tel:
            return nameList[index]
    return tel


# Return list of telephone numbers corresponding to names containing partName.
def nameToTels(partName, telList, nameList):
    # your code here
    tels = []
    for index, name in enumerate(nameList):
        if partName in name:
            tels.append(telList[index])
    return tels


def main():
    # Lists of telephone numbers and names
    telList = ['975318642', '234000111', '777888333', '911911911']
    nameList = ['Angelina', 'Brad', 'Claudia', 'Bruna']

    # Test telToName:
    tel = input("Tel number? ")
    print(telToName(tel, telList, nameList))
    print(telToName('234000111', telList, nameList) == "Brad")
    print(telToName('222333444', telList, nameList) == "222333444")

    # Test nameToTels:
    name = input("Name? ")
    print(nameToTels(name, telList, nameList))
    print(nameToTels('Clau', telList, nameList) == ['777888333'])
    print(nameToTels('Br', telList, nameList) == ['234000111', '911911911'])


if __name__ == "__main__":
    main()
