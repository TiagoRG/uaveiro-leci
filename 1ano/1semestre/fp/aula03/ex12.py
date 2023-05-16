def main():
    num = int(input('De onde vai começar o contador? '))
    for n in countdown(num):
        print(n)


# Creates a range() function with the format range(n:0:-1)
# The statement yield returns a value every repetition
def countdown(n):
    while n > 0:
        yield n
        n -= 1


if __name__ == "__main__":
    main()
