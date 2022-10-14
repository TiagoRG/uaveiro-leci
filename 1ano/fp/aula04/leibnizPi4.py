import math


def leibnizPi4(n):
    total = 0
    for x in range(1, n+1):
        if x % 2 == 0:
            total -= 1/(x*2-1)
        else:
            total += 1/(x*2-1)
    return total

def main():
    num = int(input('Introduza o número de termos: '))
    print("""
Resultado da série de Leibniz: {}
Valor do PI/4: {}
""".format(leibnizPi4(num), math.pi/4))

main()