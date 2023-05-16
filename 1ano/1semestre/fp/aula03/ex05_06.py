def max2(x, y):
    if x > y:
        return x
    else:
        return y


def max3(x, y, z):
    return max2(x, max2(y, z))


def main():
    n1 = float(input('Introduza dois valores.\nN1: '))
    n2 = float(input('N2: '))

    print('\nO maior valor é: ', max2(n1, n2))

    n1 = float(input('\n\nIntroduza tres valores.\nN1: '))
    n2 = float(input('N2: '))
    n3 = float(input('N3: '))

    print('\nO maior valor é: ', max3(n1, n2, n3))


if __name__ == "__main__":
    main()
