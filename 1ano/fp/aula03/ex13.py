""" Exercicio 13.
O algoritmo de Euclides serve para determinar o maximo divisor comum de dois numeros
naturais. Baseia-se na igualdade seguinte:
mdc(a, b) = {
    b          se  r = 0
    mdc(b, r)  se  r > 0
}
onde 'r' e o resto da divisao de 'a' por 'b'. Escreva uma funçao para calcular o
m.d.c. e teste-a com diversos pares de valores.
"""

def mdc(a, b):
    assert a > 0
    assert b > 0
    r = a % b
    if r == 0:
        return b
    else:
        return mdc(b, r)

def main():
    print('Este programa calcula o maximo divisor comum de dois numeros naturais')
    n1 = int(input('Numero 1: '))
    n2 = int(input('Numero 2: '))
    print('\nMaximo divisor comum de \'{}\' e \'{}\': {}'.format(n1, n2, mdc(n1, n2)))

main()