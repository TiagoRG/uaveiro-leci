# Complete o programa!

# a)
def loadFile(fname, lst):
    with open(fname, 'r') as f:
        f.readline()
        for line in f:
            data = line.strip('\n').split('\t')
            dataTuple = (int(data[0]), data[1], float(data[5]), float(data[6]), float(data[7]))
            lst.append(dataTuple)


# b) Crie a função notaFinal aqui...
def notaFinal(reg):
    return sum(reg[2:]) / 3


# c) Crie a função printPauta aqui...
# 4. Alterar a função...
def printPauta(lst, filename=""):
    text = f'{"Numero":>6} {"Nome":^50} {"Nota":>4}\n'
    for aluno in lst:
        text += f'{aluno[0]:>6} {aluno[1]:^50} {notaFinal(aluno):>4.1f}\n'

    print(text)
    with open(filename, 'w') as f:
        f.write(text)


# d)
def main():
    lst = []
    # ler os ficheiros (encontram-se na pasta 'datafiles' (~/1ano/fp/aula06/datafiles)
    loadFile("datafiles/school1.csv", lst)
    loadFile("datafiles/school2.csv", lst)
    loadFile("datafiles/school3.csv", lst)

    # ordenar a lista
    lst.sort()
    # mostrar a pauta
    printPauta(lst, filename="datafiles/schooldata.txt")


# Call main function
if __name__ == "__main__":
    main()
