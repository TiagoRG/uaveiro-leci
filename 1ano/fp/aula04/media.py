# Cria uma lista acessivel por todas as funções
values = []

# Pede ao utilizadores todas as parcelas e adiciona-as à lista 'values'
def GetValues():
    c = 1
    while True:
        n = input('n{}: '.format(c))
        if n == "": break
        values.append(float(n))
        c += 1

# Calcula a média dos valores da lista 'values'
def GetMedia(val):
    total = 0
    for v in val:
        total += v
    return total / len(val)

# Função principal
def main():
    GetValues()
    print('Média dos valores introduzidos: ', GetMedia(values))

main()