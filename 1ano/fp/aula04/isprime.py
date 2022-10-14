def isPrime(n):
    div_counter = 0
    for x in range(1, n):
        if n % x == 0:
            div_counter += 1
    if div_counter > 1 or n == 1:
        return False
    else:
        return True

def main():
    for x in range(1, 100):
        print('Is {} prime? {}'.format(x, isPrime(x)))

main()