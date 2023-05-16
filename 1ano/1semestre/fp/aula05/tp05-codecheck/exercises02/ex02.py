# Substitua as reticências pelo valor adequado para obter as respostas pedidas.

# Complete a definição para que transfer1car(t1, t2)
# transfira a última carruagem do comboio t1 para o comboio t2.
# t1 e t2 são listas com os números de passageiros em cada carruagem.
def transfer1car(t1, t2):
    t2.append(t1[-1])
    t1.remove(t1[-1])


def test():
    train1 = [12, 32, 10, 21]
    train2 = [9, 29, 19]
    train3 = [14, 34, 24]
    print(train1, train2, train3)

    print("\nTesting transfer1car")
    transfer1car(train1, train2)
    print(train1, train2, train3)
    transfer1car(train3, train2)
    print(train1, train2, train3)
    transfer1car(train3, train1)
    print(train1, train2, train3)


# Run tests:
test()

# JMR@ua.pt 2021
