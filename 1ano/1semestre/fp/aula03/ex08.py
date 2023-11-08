def intersects(a1, b1, a2, b2):
    assert a1 <= b1 and a2 <= b2, "Os intervalos não são válidos."
    return a1 < b2 and a2 < b1


def main():
    a1 = float(input("a1: "))
    b1 = float(input("b1: "))
    a2 = float(input("a2: "))
    b2 = float(input("b2: "))

    try:
        print(intersects(a1, b1, a2, b2))
    except AssertionError as e:
        print(e)


main()
