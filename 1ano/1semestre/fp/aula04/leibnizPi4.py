import math


def leibnizPi4(n):
    total = 0
    for x in range(1, n + 1):
        increment = 1 / (x * 2 - 1)
        total += -increment if x % 2 == 0 else increment
    return total


def main():
    num = int(input('Introduza o número de termos: '))
    print(f"""
Resultado da série de Leibniz: {leibnizPi4(num)}
Valor do PI/4: {math.pi / 4}
""")


if __name__ == "__main__":
    main()
