# Substitua as reticências pelo valor adequado para obter as respostas pedidas.

# Complete a definição para que inputDate()
# peça o ano, mês e dia de uma data (números inteiros)
# e os devolva na forma de um tuplo (ano, mês, dia).
def inputDate():
    y = int(input("Ano? "))
    m = int(input("Mês? "))
    d = int(input("Dia? "))
    return (y, m, d)


# Complete a definição de forma que inputPerson(msg)
# peça o nome de uma pessoa e a sua data de nascimento
# e devolva esses dados num tuplo com a forma (nome, (ano, mẽs, dia)).
def inputPerson(msg):
    print(msg)
    name = input("Nome? ")
    birth = inputDate()
    return (name, birth)


def test():
    print("Natal de 2020")
    natal = inputDate()
    print("natal:", natal)

    p1 = inputPerson("Introduza os dados de p1")
    print("p1:", p1)
    p2 = inputPerson("Introduza os dados de p2")
    print("p2:", p2)

    older = p1[1] < p2[1]
    print("p1 é mais velha que p2:", older)


# Run tests:
test()

# JMR@ua.pt 2021
