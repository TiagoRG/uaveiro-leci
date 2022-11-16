import os
import sys
import pathlib
import re


def main():
    if len(sys.argv) == 1 or sys.argv[1] == 'usage':
        print("""Usage:

karnaugh '<function>':
    Prints the karnaugh map of the function.
    Valid characters:
    > Variables: a-z
    > Operators: +, *, ~, (, ); You can't use ~ before ()

karnaugh bash:
    Adds the command karnaugh to bash, so you can use it from anywhere.

karnaugh bash --reset:
    Resets the command karnaugh in bash in case it's broken, so you can use it from anywhere.

karnaugh usage:
    Prints this message.""")
        return
    if sys.argv[1] == "bash":
        username = os.getlogin()
        if len(sys.argv) == 2:
            with open(f'/home/{username}/.bashrc', 'r') as bashrc:
                for line in bashrc:
                    if line.startswith('alias karnaugh='):
                        print('Command already exists, try using, after opening a new terminal, karnaugh <function>')
                        return
            os.system(f'echo "\n\nalias karnaugh=\'python3 {pathlib.Path(__file__).parent.absolute()}/karnaugh.py\'\n" >> \'/home/{username}/.bashrc\'')
            print('Command added to bash, try using karnaugh <function>.\nIf it doesn\'t work, do karnaugh bash --reset.')
        elif sys.argv[2] == '--reset':
            with open(f'/home/{username}/.bashrc', 'r') as bashrc:
                lines = bashrc.readlines()
                linesDict = {}
                index = 1
                for line in lines:
                    linesDict[index] = line
                    index += 1
                for key in linesDict:
                    if linesDict[key].startswith('alias karnaugh='):
                        del linesDict[key]
                        break
                string = ''
                for key in linesDict:
                    string += linesDict[key]
                string += f'\n\nalias karnaugh=\'python3 {pathlib.Path(__file__).parent.absolute()}/karnaugh.py\'\n'
            with open(f'/home/{username}/.bashrc', 'w') as bashrc:
                bashrc.write(string)
            print('Command readded to bash, try using, after opening a new terminal, karnaugh <function>.')
    else:
        function = sys.argv[1]

        validVariables = r"[a-z]"
        validOperators = ['+', '*', '(', ')', '~', ' ', '0', '1']

        for char in function:
            if not (re.match(validVariables, char) or char in validOperators):
                print("Invalid function, use 'karnaugh usage' to see the valid characters.")
                return

        variables = re.findall(validVariables, function)
        variables = list(dict.fromkeys(variables))
        variables.sort()

        karnaughMap = getMap(variables, function)
        printMap(variables, karnaughMap)


def getMap(variables, function):
    karnaughMap = {}
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
            karnaughMap[binary] = eval(tempFunction)
        except:
            print("Invalid function, use 'karnaugh usage' to see the valid characters.")
            return
        if karnaughMap[binary] > 1:
            karnaughMap[binary] = 1

    return karnaughMap


def printMap(variables, karnaughMap):
    for var in variables:
        print("|---", end='')
    print('|-----|')
    for var in variables:
        print("| " + var, end=' ')
    print(f"{'| f() |'}")
    for var in variables:
        print("|---", end='')
    print('|-----|')
    for key, value in karnaughMap.items():
        for char in key:
            print("| " + char, end=' ')
        print(f"|  {value}  |")
    for var in variables:
        print("|---", end='')
    print('|-----|')


if __name__ == '__main__':
    main()
