import os
import sys
import pathlib
import re


def main():
    if len(sys.argv) == 1 or sys.argv[1] == 'usage':
        print("""Usage:

truthtable '<function>':
    Prints the truth table map of the function.
    Valid characters:
    > Variables: a-z
    > Operators: +, *, ~, (, ); You can't use ~ before ()

truthtable usage:
    Prints this message.""")
        return

    function = sys.argv[1]

    validVariables = r"[a-z]"
    validOperators = ['+', '*', '(', ')', '~', ' ', '0', '1']

    for char in function:
        if not (re.match(validVariables, char) or char in validOperators):
            print("Invalid function, use 'truthtable usage' to see the valid characters.")
            return

    variables = re.findall(validVariables, function)
    variables = list(dict.fromkeys(variables))
    variables.sort()

    truthTable = getTable(variables, function)
    printTable(variables, truthTable)


def getTable(variables, function):
    truthTable = {}
    for n in range(2 ** len(variables)):
        tempFunction = function
        binary = bin(n)[2:]
        binary = '0' * (len(variables) - len(binary)) + binary
        index = 0
        for var in tempFunction:
            if index == len(tempFunction):
                break
            if var in "01" and tempFunction[index - 1] == '~':
                tempFunction = tempFunction.replace('~' + var, str(1 - int(var) + " "))
            if var in variables:
                tempFunction = tempFunction[:index] + binary[variables.index(var)] + tempFunction[index+1:] if tempFunction[index - 1] != '~' else tempFunction[:index-1] + str(int(not bool(int(binary[variables.index(tempFunction[index])]))))+" " + tempFunction[index+1:]
            index += 1
        try:
            truthTable[binary] = eval(tempFunction)
        except:
            print("Invalid function, use 'truthtable usage' to see the valid characters.")
            return
        if truthTable[binary] > 1:
            truthTable[binary] = 1
        if truthTable[binary] < 0:
            truthTable[binary] = 0

    return truthTable


def printTable(variables, truthTable):
    for var in variables:
        print("|---", end='')
    print('|-----|')
    for var in variables:
        print("| " + var, end=' ')
    print(f"{'| f() |'}")
    for var in variables:
        print("|---", end='')
    print('|-----|')
    for key, value in truthTable.items():
        for char in key:
            print("| " + char, end=' ')
        print(f"|  {value}  |")
    for var in variables:
        print("|---", end='')
    print('|-----|')


if __name__ == '__main__':
    main()
