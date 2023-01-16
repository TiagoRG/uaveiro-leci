import bisect


def main() -> None:
    with open("wordlist.txt", "r") as f:
        word_list: list[str] = f.read().split()

    prefix = ""
    while True:
        prefix += input(f"Current prefix: {'None' if prefix == '' else prefix}\nAdd to prefix: ")
        print(prefixSearch(word_list, prefix))


def prefixSearch(lst: list[str], prefix: str) -> list[str]:
    begin_index = bisect.bisect_left(lst, prefix)
    end_index = bisect.bisect_left(lst, prefix + chr(127))

    return lst[begin_index:end_index]


if __name__ == "__main__":
    main()
