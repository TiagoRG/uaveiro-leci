import os
from sys import argv


def main():
    path = argv[1] if len(argv) > 1 else os.getcwd()
    printFilesSize(path)


def printFilesSize(path):
    try:
        directory = os.listdir(path)
    except FileNotFoundError:
        print(f"[Error] Unable to find that directory: '{os.path.abspath(path)}'")
        exit(1)
    except NotADirectoryError:
        print(f"[Error] Path is not a directory: '{os.path.abspath(path)}'")
        exit(1)
    else:
        print(f'|{"-" * 78}|')
        print(f'| {"File":<63} {"Size":>12} |\n|{"-" * 78}|')
        for file in directory:
            base_size = os.stat(f'{path}/{file}').st_size
            if os.path.isdir(f'{path}/{file}'):
                size = "-Directory-"
            elif base_size < 1024:
                size = str(base_size) + ' B'
            elif base_size < 1024 ** 2:
                size = f'{base_size // 1024}.{str(base_size % 1024)[0]} KB'
            elif base_size < 1024 ** 3:
                size = f'{base_size // (1024 ** 2)}.{str(base_size % (1024 ** 2))[0]} MB'
            else:
                size = f'{base_size // (1024 ** 3)}.{str(base_size % (1024 ** 3))[0]} GB'
            print(f'| {file:<63} {size:>12} |')
        print(f'|{"-" * 78}|')


if __name__ == "__main__":
    main()
