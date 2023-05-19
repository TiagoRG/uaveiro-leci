def mdc(a, b):
    assert a > 0
    assert b > 0
    r = a % b
    if r == 0:
        return b
    else:
        return mdc(b, r)


def main():
    print('Este programa calcula o máximo divisor comum de dois námeros naturais')
    n1 = int(input('Numero 1: '))
    n2 = int(input('Numero 2: '))
    print(f'\nO Máximo Divisor Comum de {n1} e {n2} é: {mdc(n1, n2)}')


if __name__ == "__main__":
    main()
