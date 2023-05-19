def main():
    s = input('Introduza uma string >> ')
    print(ispalindrome(s))


def ispalindrome(s):
    pal_s = s[::-1]
    return pal_s == s


if __name__ == "__main__":
    main()
