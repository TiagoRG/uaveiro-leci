import sys


def integrate(f, a, b, n):
    """The integral of f(x) for x between a and b.
    Aproximated using the trapezoidal rule with n uniform subintervals."""
    assert n >= 1
    return ((b - a) / 2 * n * (f(a) + sum(2 * f(a + (b - a) * i / n) for i in range(1, n)) + f(a + (b - a)))) / (n ** 2)


def example(n):
    a = integrate(lambda x: (x - 2) / (x + 3), 0, 1, n)
    return a


# You may define auxiliary functions here.


# Do not change the code below!
def evalPrint(expression):
    # Evaluate and print an expression and its result.
    result = eval(expression)
    print("{}\n--> {!r}".format(expression, result))


if __name__ == "__main__":
    evalPrint(" ".join(sys.argv[1:]))
