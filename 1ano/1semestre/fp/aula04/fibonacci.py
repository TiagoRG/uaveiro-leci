def fibonacci(n):
    if n == 0: return 0
    if n == 1: return 1
    return fibonacci(n - 1) + fibonacci(n - 2)


def main():
    n = int(input('Introduza um número: '))
    print(f'O {n}º número de Fibonacci é: {fibonacci(n)}')


if __name__ == "__main__":
    main()
