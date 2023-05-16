# Função principal
def main():
    n = int(input('Introduza um número: '))
    div_list_array = divList(n)

    div_list = ", ".join(div_list_array)

    print(f"""

--------------------

Número introduzido: {n}

Lista de divisores:
{div_list}

Este é um número {category(n, div_list_array)}.

--------------------
    
""")


# Obtém uma lista com todos os dividores de um número
def divList(n):
    divs = []
    for x in range(1, n):
        if n % x == 0:
            divs.append(str(x))
    return divs


# Obtém a categoria de um número
def category(n, divs):
    total = 0
    for div in divs:
        total += int(div)
    if total < n: return 'deficiente'
    if total == n: return 'perfeito'
    if total > n: return 'abundante'


if __name__ == "__main__":
    main()
