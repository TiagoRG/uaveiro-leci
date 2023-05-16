# Read numbers until a sentinel (an empty string), and return their sum.
# JMR 2018


def inputTotal():
    """Read numbers until empty string is entered and return the sum."""
    tot = 0.0
    while True:
        n = input("valor? ")  # input("valor? ")
        if n == '': return tot
        tot += float(n)


# MAIN PROGRAM
def main():
    tot = inputTotal()
    print(tot)


if __name__ == "__main__":
    main()
