# Função principal
def main():
    n = int(input('Introduza um número: '))
    div_list_array = divList(n)

    # Transforma a lista obtida numa string para imprimir
    div_list = ""
    for div in div_list_array:
        div_list += (str(div) + ', ')
    div_list = div_list[:len(div_list)-2]
    # ---
    
    print("""

--------------------

Número introduzido: {}

Lista de divisores:
{}

Este é um número {}.

--------------------

""".format(n, div_list, category(n, div_list_array)))

# Obtém uma lista com todos os dividores de um número
def divList(n):
    divs = []
    for x in range(1, n):
        if n % x == 0:
            divs.append(x)
    return divs

# Obtém a categoria de um número
def category(n, divs):
    total = 0
    for div in divs:
        total += div
    if total < n: return 'deficiente'
    if total == n: return 'perfeito'
    if total > n: return 'abundante'

main()