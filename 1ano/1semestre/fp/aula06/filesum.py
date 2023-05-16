from tkinter import filedialog


def main():
    # 1) Pedir nome do ficheiro (usando alternativa #B):
    name = filedialog.askopenfilename(title="Choose File")

    # 2) Calcular soma dos números no ficheiro:
    total = fileSum(name)

    # 3) Mostrar a soma:
    print("Sum:", total)


def fileSum(filename):
    # Complete a função para ler números do ficheiro e devolver a sua soma.
    with open(filename, 'r') as f:
        lines = f.readlines()
        total = 0
        for line in lines:
            total += float(line)
        return total


if __name__ == "__main__":
    main()
