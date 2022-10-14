# Complete the code to make the HiLo game...

import random

def main():
    # Pick a random number between 1 and 100, inclusive
    secret = random.randrange(1, 101)
    print("Can you guess my secret?")
    # put your code here
    c = 0
    num = -1
    while secret != num:
        num = int(input('>>> '))
        if num > secret:
            print('High')
        if num < secret:
            print('Low')
        c += 1
    print('Well done! The secret number was {}. It took you {} tries to get it right.'.format(secret, c))

main()
