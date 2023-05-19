def main():
    print(shorten("Universidade de Aveiro"))
    print(shorten("United Nations Organization"))


def shorten(string):
    return ''.join([char for char in string if char.isupper()])


if __name__ == "__main__":
    main()
