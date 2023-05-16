# Substitua as reticências pelo valor adequado para obter as respostas pedidas.

# Considere que num comboio de passageiros
# as primeiras N carruagens têm lugares de primeira classe
# enquanto as restantes têm lugares de segunda classe.

# Complete a definição para que passengers(train, n)
# devolva uma lista com dois elementos, [num1, num2], onde:
# num1 = número de passageiros em primeira classe (nas n primeiras carruagens)
# num2 = número de passageiros em segunda classe.
def passengers(train, n):
    class1 = train[:n]
    class2 = train[n:]
    num1 = sum(class1)
    num2 = sum(class2)
    return [num1, num2]


def test():
    train1 = [12, 32, 10, 21]
    train2 = [9, 29, 19]
    train3 = [14, 34, 24]
    print(train1, train2, train3)

    print('\nTesting passengers')
    print(passengers(train1, 2))
    print(passengers(train2, 1))
    print(passengers(train3, 0))


# Run tests:
test()

# JMR@ua.pt 2021
