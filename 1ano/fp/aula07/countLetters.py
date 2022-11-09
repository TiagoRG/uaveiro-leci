import sys


def main():
    # Read the file
    f = open(sys.argv[1], 'r')
    text = f.read()
    f.close()

    # Count the letters
    letters = {}
    for c in text:
        if c.isalpha():
            c = c.lower()
            if c in letters:
                letters[c] += 1
            else:
                letters[c] = 1

    # Print the results
    for c in sorted(letters.keys()):
        print(c, letters[c])


if __name__ == "__main__":
    main()
