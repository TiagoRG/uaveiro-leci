def main():
    print(shorten("Universidade de Aveiro"))
    print(shorten("United Nations Organization"))


def shorten(string):
    abv = ''
    for char in string:
        if char.isupper():
            abv += char
    return abv
            
if __name__ == "__main__":
    main()