# Algorithm from https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes#Pseudocode
def primesUpTo(n):
    assert n >= 2, "n must be >= 2"
    A = [True for i in range(n + 1)]

    for i in range(2, n + 1):
        if A[i]:
            for j in range(i ** 2, n + 1, i):
                A[j] = False

    return set([i for i in range(2, n + 1) if A[i]])


def main():
    # Testing:
    s = primesUpTo(1000)
    print(s)

    # Do some checks:
    assert primesUpTo(30) == {2, 3, 5, 7, 11, 13, 17, 19, 23, 29}
    assert len(primesUpTo(1000)) == 168
    assert len(primesUpTo(7918)) == 999
    assert len(primesUpTo(7919)) == 1000
    print("All tests passed!")


if __name__ == "__main__":
    main()
