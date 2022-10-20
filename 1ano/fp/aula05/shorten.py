import re


def main():
    print(shorten("Universidade de Aveiro"))
    print(shorten("United Nations Organization"))
    
def shorten(string):
    abv = ''
    upper = r"[A-Z]$"
    for char in string:
        if re.match(upper, char):
            abv += char
    return abv
            
if __name__ == "__main__":
    main()