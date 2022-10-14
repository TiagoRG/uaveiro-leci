def divList(n):
    divs = []
    for x in range(1, n):
        if n % x == 0:
            divs.append(x)
    return divs

def category(n):
    total = 0
    for div in divList(n):
        total += div
    if total < n: return 'deficiente'
    if total == n: return 'perfeito'
    if total > n: return 'abundante'

def main():
    n = int(input('Introduza um número: '))
    div_list = ""
    div_list_array = divList(n)
    for div in div_list_array:
        div_list += str(div)
        if div != div_list_array[len(div_list_array)-1]:
            div_list += ', '
    print("""

--------------------

Número introduzido: {}

Lista de divisores:
{}

Este é um número {}.

--------------------

""".format(n, div_list, category(n)))

main()