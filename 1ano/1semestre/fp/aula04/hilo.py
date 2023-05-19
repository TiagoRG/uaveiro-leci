# Complete the code to make the HiLo game...

import random


def main():
    # Pick a random number between 1 and 100, inclusive
    secret = random.randrange(1, 101)
    print("Can you guess my secret?")
    # put your code here
    c = 0
    trieslist = []
    num = -1
    while secret != num:
        num = int(input('>>> '))
        if num > secret:
            print('High')
        if num < secret:
            print('Low')
        c += 1
        trieslist.append(str(num))
    triesstr = ', '.join(trieslist)
    print(
        f'Well done! The secret number was {secret}. It took you {c} tries to get it right.\nList of tries: {triesstr}')


if __name__ == "__main__":
    main()
