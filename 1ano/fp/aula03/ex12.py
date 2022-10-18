def main():
    num = int(input('De onde vai começar o contador? '))
    for n in countdown(num):
        print(n)

def countdown(n):
    while n > 0:
        yield n
        n -= 1

if __name__ == "__main__":
    main()