import pytest


def fibonacci(n):
    res = []

    if n < 0:
        return res
    elif n == 0:
        res.append(n)
        return res
    elif n == 1:
        res = [0, 1]
        return res
    else:
        res = [0, 1]
        for i in range(2, n + 1):
            x = res[i - 1] + res[i - 2]
            res.append(x)
        return res


def test_inferior_1():
    print("Testa comportamento com n < 1")

    assert fibonacci(-1) == []
    assert fibonacci(0) == [0]
    assert fibonacci(1) == [0, 1]
    assert fibonacci(2) == [0, 1, 1]
    assert fibonacci(5) == [0, 1, 1, 2, 3, 5]
