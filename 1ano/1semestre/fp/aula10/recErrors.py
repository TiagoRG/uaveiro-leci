# Calcula o factorial de n, baseado na recorrencia n! = n*(n-1)!.
# Mas não termina!  Detete a causa e corrija o erro.
def fact(n):
    if n == 0:
        return 1
    return n * fact(n - 1)


# Calcula o maximo divisor comum entre a e b.
# Baseia-se no algoritmo de Euclides.
# Mas não termina! Detete a causa e corrija o erro.
def gcd(a, b):
    assert a > 0 and b > 0
    if a % b == 0:
        return b
    return gcd(b, a % b)


def main():
    print(fact(4))  # 24
    print(fact(5))  # 120

    x = 2 * 27 * 53 * 61
    y = 2 * 2 * 17 * 23 * 53
    print(x, y, gcd(x, y))
    assert gcd(x, y) == 2 * 53


if __name__ == "__main__":
    main()
