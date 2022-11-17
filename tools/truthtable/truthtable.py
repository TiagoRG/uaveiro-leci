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

truthtable bash:
    Adds the command truthtable to bash, so you can use it from anywhere.

truthtable bash --reset:
    Resets the command truthtable in bash in case it's broken, so you can use it from anywhere.

truthtable usage:
    Prints this message.""")
        return
    if sys.argv[1] == "bash":
        username = os.getlogin()
        if len(sys.argv) == 2:
            with open(f'/home/{username}/.bashrc', 'r') as bashrc:
                for line in bashrc:
                    if line.startswith('alias truthtable='):
                        print('Command already exists, try using, after opening a new terminal, truthtable \'<function>\'')
                        return
            os.system(f'echo "\n\nalias truthtable=\'python3 {pathlib.Path(__file__).parent.absolute()}/truthtable.py\'\n" >> \'/home/{username}/.bashrc\'')
            print('Command added to bash, try using truthtable <function>.\nIf it doesn\'t work, do truthtable bash --reset.')
        elif sys.argv[2] == '--reset':
            with open(f'/home/{username}/.bashrc', 'r') as bashrc:
                lines = bashrc.readlines()
                linesDict = {}
                index = 1
                for line in lines:
                    linesDict[index] = line
                    index += 1
                for key in linesDict:
                    if linesDict[key].startswith('alias truthtable='):
                        del linesDict[key]
                        break
                string = ''
                for key in linesDict:
                    string += linesDict[key]
                string += f'\n\nalias truthtable=\'python3 {pathlib.Path(__file__).parent.absolute()}/truthtable.py\'\n'
            with open(f'/home/{username}/.bashrc', 'w') as bashrc:
                bashrc.write(string)
            print('Command readded to bash, try using, after opening a new terminal, truthtable <function>.')
    else:
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
                tempFunction = tempFunction.replace('~' + var, str(1 - int(var)))
            if var in variables:
                tempFunction = tempFunction.replace(tempFunction[index], binary[variables.index(var)]) if tempFunction[index - 1] != '~' else tempFunction.replace(f"~{tempFunction[index]}", str(int(not int(binary[variables.index(tempFunction[index])])))+" ")
            index += 1
        try:
            truthTable[binary] = eval(tempFunction)
        except:
            print("Invalid function, use 'truthtable usage' to see the valid characters.")
            return
        if truthTable[binary] > 1:
            truthTable[binary] = 1

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
