""" Exercicio 05.
Defina uma funçao que devolva o maior dos seus dois argumentos. Por exemplo, max2(4, 3)
deve devolver 4 e max2(-3, -2) deve devolver -2. Nao pode usar a funçao pre-definida max.
Use uma instruçao if ou uma expressao condicional. Teste a funçao com varios conjuntos
de argumentos. 
"""
""" Exercicio 06.
No mesmo programa, crie uma funçao max3 que devolva o maior dos seus 3 argumentos. Nao
pode usar a funçao max, nem instruçoes ou expressoes condicionais. Recorra apenas a
funçao max2 que definiu atras. Teste a nova funçao.
"""

def max2(x, y):
    if x > y:
        return x
    else:
        return y

def max3(x, y, z):
    return max2(x, max2(y, z))

n1 = float(input('Introduza dois valores.\nN1: '))
n2 = float(input('N2: '))

print('\nO maior valor é: ', max2(n1, n2))

n1 = float(input('\n\nIntroduza tres valores.\nN1: '))
n2 = float(input('N2: '))
n3 = float(input('N3: '))

print('\nO maior valor é: ', max3(n1, n2, n3))