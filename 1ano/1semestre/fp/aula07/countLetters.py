import sys


def main():
    letters = countLetters(sys.argv[1])

    # Print the results
    for c in sorted(letters.keys()):
        print(c, letters[c])

    # Print the most used letter and the number of times it's used
    usedTheMostCount = max(letters.values())
    usedTheMost = [letter for letter in letters.keys() if letters[letter] == usedTheMostCount][0]
    print(f"A letra mais usada foi '{usedTheMost}', usada {usedTheMostCount} vezes.")


def countLetters(filename):
    # Read the file and count the letters
    letters = {}
    with open(filename, 'r') as f:
        for c in f.read():
            if c.isalpha():
                c = c.lower()
                if c not in letters:
                    letters[c] = 0
                letters[c] += 1

    # Returns the dictionary with the letters
    return letters


if __name__ == "__main__":
    main()
