def main():
    s = input('Introduza uma string >> ')
    print(ispalindrome(s))
    
def ispalindrome(s):
    pal_s = s[::-1]
    if pal_s == s:
        return True
    else:
        return False
    
if __name__ == "__main__":
    main()