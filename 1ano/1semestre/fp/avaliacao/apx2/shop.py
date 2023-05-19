# Pode correr o programa sem argumentos:
#   python3 shop
# ou passando outros ficheiros de produtos como argumento:
#   python3 shop produtos1.txt ...

def loadDataBase(fname, produtos):
    """Lê dados do ficheiro fname e atualiza/acrescenta a informação num
    dicionário de produtos com o formato {código: (nome, secção, preço, iva), ...}.
    """
    with open(fname, 'r') as f:  # Abre o ficheiro em modo de leitura
        productsFileContent = f.read()  # Cria uma string com o conteudo do ficheiro

    for product in productsFileContent.split('\n')[
                   1:]:  # Divide a string 'productsFileContent' numa lista com cada produto
        productComponents = product.split(';')  # Divide as componentes do produto (código, nome, secção, preço, iva)

        if len(productComponents) != 5:
            continue

        produtos.update({productComponents[0]: (  # Atualiza a entrada de uma determinada chave (código)
            productComponents[1],  # Nome
            productComponents[2],  # Secção
            float(productComponents[3]),  # Preço
            float(productComponents[4].strip('%')) / 100  # IVA
        )})


def registaCompra(produtos):
    """Lê códigos de produtos (ou códigos e quantidades),
    mostra nome, quantidade e preço final de cada um,
    e devolve dicionário com {codigo: quantidade, ...}
    """
    compra = {"totals": [0, 0,
                         0]}  # Inicia o dicionário da compra com os totais da mesma: [total bruto, total iva, total liquido]
    userInput = input('Code? ')
    while userInput != "":
        try:
            code, amount = userInput.split(' ')  # Divide o input do utilizador no código e na quantia
        except ValueError:
            code, amount = userInput, 1  # No caso de não ser introduzida quantia, então ela fica 1

        # Caso a segunda parcela da entrada não seja um número, é pedido ao utilizador para introduzir o código de novo
        try:
            amount = int(amount)
        except ValueError:
            userInput = input('Code? ')
            continue

        if code in produtos:
            if code not in compra:  # Se o produto ainda não estiver na lista é adicionado à mesma
                compra[code] = 0

            compra[code] += amount  # Adiciona ao dicionário da compra a quantidade comprada do produto
            noIvaPrice = produtos[code][2] * amount  # Obtém o preço (sem iva) do determinado produto
            compra["totals"][0] += noIvaPrice  # Adiciona o preço sem iva ao total bruto
            compra["totals"][1] += noIvaPrice * produtos[code][3]  # Adiciona o valor do iva ao total iva
            print(f"{produtos[code][0]}  {amount}  {noIvaPrice * (1 + produtos[code][3]):.2f}")

        userInput = input('Code? ')

    compra["totals"][2] += compra["totals"][0] + compra["totals"][1]  # Calcula o total liquido da compra
    return compra  # Devolve a lista


def fatura(produtos, compra):
    """Imprime a fatura de uma dada compra."""

    # Obtém a lista de secções presentes na compra (por ordem alfabética)
    sections = sorted(
        list({section for section in [product[1] for code, product in produtos.items() if code in compra]}))

    # Itera as secções para apresentar os produtos ordenados por secção
    for section in sections:
        print(section)  # Mostra a secção

        # Obtém a lista de codigos usados na compra presentes na secção atual
        sectionProductsCodes = sorted([code for code in produtos if produtos[code][1] == section and code in compra])

        # Itera os códigos para apresentar as informações de cada produto
        for code in sectionProductsCodes:
            print(
                f"{compra[code]:>4} {produtos[code][0]:<31}({int(produtos[code][3] * 100):>2}%){round(compra[code] * produtos[code][2] * (1 + produtos[code][3]), 2):>11}")

    # Apresenta os totais da compra
    print(f"""{'Total Bruto:':>41}{round(compra["totals"][0], 2):>11}
{'Total IVA:':>41}{round(compra["totals"][1], 2):>11}
{'Total Liquido:':>41}{round(compra["totals"][2], 2):>11}""")


def main(args):
    # produtos guarda a informação da base de dados numa forma conveniente.
    produtos = {'p1': ('Ketchup.', 'Mercearia Salgado', 1.59, 0.23)}
    # Carregar base de dados principal
    loadDataBase("produtos.txt", produtos)
    # Juntar bases de dados opcionais (Não altere)
    for arg in args:
        loadDataBase(arg, produtos)

    # Use este código para mostrar o menu e ler a opção repetidamente
    MENU = "(C)ompra (F)atura (S)air ? "
    compras = {}
    repetir = True
    while repetir:
        # Utilizador introduz a opção com uma letra minúscula ou maiúscula
        op = input(MENU).upper()
        # Processar opção
        if op == "C":
            # Esta opção regista os produtos de uma compra
            compras[len(compras) + 1] = registaCompra(produtos)

        elif op == "F":
            # Esta opção apresenta a fatura de uma compra
            try:
                numCompra = int(input("Numero compra? "))
                fatura(produtos, compras[numCompra])
            except:
                continue

        elif op == "S":
            repetir = False

    print("Obrigado!")


# Não altere este código / Do not change this code
import sys

if __name__ == "__main__":
    main(sys.argv[1:])
