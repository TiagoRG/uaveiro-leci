def main():
    print(countDigits("far4214faewf13"))  # Tem de dar 6


def countDigits(string):
    count = 0
    for char in string:
        if char.isdigit():
            count += 1
    return count


if __name__ == "__main__":
    main()
