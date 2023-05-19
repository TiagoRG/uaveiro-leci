def tax(r):
    if r <= 1000:
        return 0.1 * r
    if r <= 2000:
        return 0.2 * r - 100
    return 0.3 * r - 300


x = float(input('R? '))
print('O valor de tax(r) é: {:.3f}'.format(tax(x)))
