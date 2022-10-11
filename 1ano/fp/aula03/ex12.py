""" Exercicio 12.
Escreva uma funçao countdown (N) que imprima uma contagem decrescente a partir de um
numero positivo N. Note que pode imprimir N e depois chamar countdown (N - 1).
Teste a funçao com diversos valores de N.
"""

def main():
    num = int(input('De onde vai começar o contador? '))
    countdown(num)

def countdown(n):
    assert n > 0
    print(n)
    if n > 0:
        countdown(n - 1)

main()