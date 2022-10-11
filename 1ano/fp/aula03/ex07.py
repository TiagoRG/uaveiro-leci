""" Exercicio 07.
Escreva uma funçao, tax(4), que implemente a seguinte funçao de ramos:
tax(r) = {
    0.1r        se  r <= 1000
    0.2r - 100  se  1000 < r <= 2000
    0.3r - 300  se  2000 < r
}
Use uma instruçao if-elif-else e evite condiçoes redundantes. Teste a funçao para
diversos valores de r e confirme os resultados. Que valores deve testar?
"""


def tax(r):
    if r <= 1000:
        return 0.1 * r
    if r <= 2000:
        return 0.2 * r - 100
    return 0.3 * r - 300

x = float(input('R? '))
print('O valor de tax(r) é: {:.3f}'.format(tax(x)))