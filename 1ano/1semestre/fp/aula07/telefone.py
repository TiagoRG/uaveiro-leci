# Complete este programa como pedido no guião da aula.

def listContacts(dic):
    """Print the contents of the dictionary as a table, one item per row."""
    print("{:>12s} : {:^35s} : {:<12s}".format("Numero", "Nome", "Morada"))
    for num in dic:
        print("{:>12s} : {:^35s} : {:<12s}".format(num, dic[num][0], dic[num][1]))


def addContact(dic):
    name = input("Nome: ")
    number = input("Número: ")
    address = input("Morada: ")
    dic[number] = (name, address)


def removeContact(dic):
    number = input("Número: ")
    del dic[number]


def searchContact(dic):
    number = input("Número: ")
    print(f"""Nome: {dic[number][0] if number in dic else number}
Morada: {dic[number][1] if number in dic else '----'}""")


def filterPartName(contacts, partName):
    """Returns a new dict with the contacts whose names contain partName."""
    newDict = {}
    for num in contacts:
        if partName in contacts[num]:
            newDict[num] = contacts[num]
    return newDict


def menu():
    """Shows the menu and gets user option."""
    print()
    print("(L)istar contactos")
    print("(A)dicionar contacto")
    print("(R)emover contacto")
    print("Procurar (N)úmero")
    print("Procurar (P)arte do nome")
    print("(T)erminar")
    op = input("opção? ").upper()  # converts to uppercase...
    return op


def main():
    """This is the main function containing the main loop."""

    # The list of contacts (it's actually a dictionary!):
    contactos = {"234370200": ("Universidade de Aveiro", "Campus de Santiago"),
                 "727392822": ("Cristiano Aveiro", "Casa"),
                 "387719992": ("Maria Matos", "Rua da Matos, 123"),
                 "887555987": ("Marta Maia", "Rua da Maia, 123"),
                 "876111333": ("Carlos Martins", "Rua dos Martins, 123"),
                 "433162999": ("Ana Bacalhau", "Rua do Bacalhau, 123"),
                 }

    op = ""
    while op != "T":
        op = menu()
        if op == "T":
            print("Fim")
        elif op == "L":
            print("Contactos:")
            listContacts(contactos)
        elif op == "A":
            print("Novo contacto:")
            addContact(contactos)
        elif op == "R":
            print("Remover contacto:")
            removeContact(contactos)
        elif op == "N":
            print("Procurar número:")
            searchContact(contactos)
        elif op == "P":
            print("Procurar parte do nome:")
            partName = input("Parte do nome: ")
            newDict = filterPartName(contactos, partName)
            listContacts(newDict)
        else:
            print("Não implementado!")


# O programa começa aqui
main()
