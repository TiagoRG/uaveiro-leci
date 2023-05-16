def main():
    lst = [1, 2, 4, 5, 6]
    print(median(lst))


def median(lst):
    lst = sorted(lst, reverse=True)
    if len(lst) % 2 == 0:
        middle = len(lst) // 2 - 1
        return sum(lst[middle:middle + 2]) / 2
    else:
        return lst[len(lst) // 2]


if __name__ == '__main__':
    main()
