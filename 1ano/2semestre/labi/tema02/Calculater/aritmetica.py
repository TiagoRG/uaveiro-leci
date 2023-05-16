import math

def soma(a, b):
    return round(a + b, 2)

def subtracao(a, b):
    return round(a - b, 2)

def multiplicacao(a, b):
    return round(a * b, 2)

def divisao(a, b):
    if b == 0:
        raise ZeroDivisionError("Não é possível dividir por zero.")
    return round(a / b, 2)

def resto_divisao_inteira(a, b):
    if b == 0:
        raise ZeroDivisionError("Não é possível dividir por zero.")
    return round(a % b, 2)

def raiz_quadrada(a):
    if a < 0:
        raise ValueError("Não é possível calcular a raiz quadrada de um número negativo.")
    return round(math.sqrt(a), 2)
