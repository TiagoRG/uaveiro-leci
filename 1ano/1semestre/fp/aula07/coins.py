# A set of functions to deal with bags of money.
#
# JMR 2017


# Face values of coins (in cents):
COINS = [200, 100, 50, 20, 10, 5, 2, 1]


def value(bag):
    """Return total amount in a bag."""
    totalValue = 0
    for coin in bag:
        totalValue += bag[coin] * coin
    return totalValue


def transfer1coin(bag1, c, bag2):
    """Try to transfer one coin of value c from bag1 to bag2.
    If possible, transfer coin and return True, otherwise return False."""
    if bag1[c] == 0:
        return False

    bag1[c] -= 1
    bag2[c] = 1 if c not in bag2 else bag2[c] + 1

    return True


def transfer(bag1, amount, bag2):
    """Try to transfer an amount from bag1 to bag2.
    If possible, transfer coins and return True,
    otherwise, return False and leave bags with same values."""

    # Uses a support method not to reuse the coins if they will make the process not possible
    return transferProcess(bag1, amount, bag2, COINS)


def transferProcess(bag1, amount, bag2, coins):
    bagBackup = (bag1.copy(), bag2.copy())
    amountBackup = amount

    firstUsedCoin = None
    for coin in coins:
        while amount >= coin and transfer1coin(bag1, coin, bag2) and amount > 0:
            amount -= coin
            if firstUsedCoin is None:
                firstUsedCoin = coin

    if amount == 0:
        return True

    for coin in COINS:
        bag1[coin] = bagBackup[0][coin] if coin in bagBackup[0] else 0
        bag2[coin] = bagBackup[1][coin] if coin in bagBackup[1] else 0

    if len(coins) == 1:
        return False
    return transferProcess(bag1, amountBackup, bag2, COINS[COINS.index(firstUsedCoin) + 1:])


def strbag(bag):
    """Return a string representing the contents of a bag."""
    # You may want to change this to produce a more user-friendly
    # representation such as "4x200+3x50+1x5+3x1=958".
    string = ""
    for coin in bag:
        if bag[coin] != 0:
            string = f"+{bag[coin]}x{coin}{string}"
    string = f"{string[1:]}={value(bag)}"
    return string


def main():
    # A bag of coins is represented by a dict of {coin: number} items
    bag1 = {1: 4, 2: 0, 5: 1, 10: 0, 20: 5, 50: 4, 100: 2, 200: 1}
    bag2 = {}

    # Test the value function.
    assert value({}) == 0
    assert value({1: 7, 5: 2, 20: 4, 100: 1}) == 197

    # Test the strbag function.
    print(strbag({1: 7, 5: 2, 20: 4, 100: 1}))  # 1x100+4x20+2x5+7x1=197
    print(strbag({1: 7, 5: 2, 10: 0, 20: 4, 100: 1}))  # 1x100+4x20+2x5+7x1=197

    print("bag1:", strbag(bag1))  # bag1: 1x200+2x100+4x50+5x20+1x5+4x1=709
    print("bag2:", strbag(bag2))  # bag2: =0

    print(transfer1coin(bag1, 10, bag2))  # False!
    print("bag1:", strbag(bag1))  # bag1: 1x200+2x100+4x50+5x20+1x5+4x1=709
    print("bag2:", strbag(bag2))  # bag2: =0

    print(transfer1coin(bag1, 20, bag2))  # True
    print("bag1:", strbag(bag1))  # bag1: 1x200+2x100+4x50+4x20+1x5+4x1=689
    print("bag2:", strbag(bag2))  # bag2: 1x20=20

    print(transfer1coin(bag1, 20, bag2))  # True
    print("bag1:", strbag(bag1))  # bag1: 1x200+2x100+4x50+3x20+1x5+4x1=669
    print("bag2:", strbag(bag2))  # bag2: 2x20=40

    print(transfer(bag1, 157, bag2))  # True (should be easy)
    print("bag1:", strbag(bag1))  # bag1: 1x200+1x100+3x50+3x20+2x1=512
    print("bag2:", strbag(bag2))  # bag2: 1x100+1x50+2x20+1x5+2x1=197

    print(transfer(bag1, 60, bag2))  # not easy, but possible...
    print("bag1:", strbag(bag1))
    print("bag2:", strbag(bag2))

    return


if __name__ == "__main__":
    main()
