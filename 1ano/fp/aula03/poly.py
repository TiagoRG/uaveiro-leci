# Esta função implementa g(x) = 8 - x**3
g = lambda x: 8 - x**3

# Defina uma função que implemente p(x) = x**2 + 2x + 3
p = lambda x: x**2 + 2*x + 3

def main():
    # Mostra alguns valores da função g:
    print("g(1) =", g(1))
    print("g(2) =", g(2))
    print("g(10) =", g(10))

    # Acrescente instruções para mostrar os valores de
    # p(1), p(2), p(10) e g(1 + p(3)).
    print("""p(1) = {}
p(2) = {}
p(10) = {}
g(1 + p(3)) = {}""".format(p(1), p(2), p(10), g(1 + p(3))))

if __name__ == '__main__':
    main()

