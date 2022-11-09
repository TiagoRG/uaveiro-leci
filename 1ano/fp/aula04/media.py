# Pede ao utilizadores todas as parcelas e adiciona-as à lista 'values'
def GetValues():
    c = 1
    values = []
    while True:
        n = input('n{}: '.format(c))
        if n == "": break
        values.append(float(n))
        c += 1
    return values

# Calcula a média dos valores da lista 'values'
def GetMedia(val):
    return sum(val) / len(val)

# Função principal
def main():
    values = GetValues()
    print('Média dos valores introduzidos: ', GetMedia(values))

if __name__ == "__main__":
    main()