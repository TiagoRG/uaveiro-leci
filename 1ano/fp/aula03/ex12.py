def main():
    num = int(input('De onde vai começar o contador? '))
    countdown(num)

def countdown(n):
    assert n > 0
    print(n)
    if n > 0:
        countdown(n - 1)

main()