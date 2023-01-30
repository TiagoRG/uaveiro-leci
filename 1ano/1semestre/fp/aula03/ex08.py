def intersects(a1, b1, a2, b2):
    assert a1 < b1
    assert a2 < b2

    if a1 < b2 and a2 < b1:
        return True
    else:
        return False

a1 = float(input("a1: "))
b1 = float(input("b1: "))
a2 = float(input("a2: "))
b2 = float(input("b2: "))

print(intersects(a1, b1, a2, b2))