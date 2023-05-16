import math


def main():
    print(findZero(lambda x: x + math.sin(10 * x), 0.2, 0.4, 0.001))


def findZero(func, a, b, tol):
    if func(a) * func(b) > 0:
        return None

    while b - a > tol:
        m = (a + b) / 2
        if func(a) * func(m) <= 0:
            b = m
        else:
            a = m

    return (a + b) / 2


if __name__ == '__main__':
    main()
