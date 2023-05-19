def factorial(n):
    total = 1
    for x in range(1, n + 1):
        total *= x
    return total


def main():
    n = int(input('Introduza um número: '))
    print('O fatorial de {} é: {}'.format(n, factorial(n)))


if __name__ == "__main__":
    main()
