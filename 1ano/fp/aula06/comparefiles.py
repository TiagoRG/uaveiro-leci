from sys import argv


def main():
    if len(argv) != 3:
        file1 = input('File 1: ')
        file2 = input('File 2: ')
    else:
        file1, file2 = argv[1:]

    if compareFiles(file1, file2):
        print('Os ficheiros são iguais!')
    else:
        print('Os ficheiros são diferentes!')


def compareFiles(file1, file2):
    with open(file1, 'rb') as f1, open(file2, 'rb') as f2:
        while True:
            data1 = f1.read(1024)
            data2 = f2.read(1024)
            if data1 != data2:
                return False
            if not data1 or not data2:
                return True


if __name__ == "__main__":
    main()
