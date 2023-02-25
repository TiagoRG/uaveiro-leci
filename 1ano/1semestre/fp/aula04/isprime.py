def isPrime(n):
    if n == 1:
        return False
    for x in range(2, n):
        if n % x == 0:
            return False
    return True


def main():
    for x in range(1, 100):
        print('Is {} prime? {}'.format(x, isPrime(x)))


if __name__ == "__main__":
    main()
