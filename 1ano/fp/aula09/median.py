def main():
    lst = [1, 2, 4, 5]
    print(median(lst))


def median(lst):
    lst = sorted(lst, reverse=True)
    if len(lst) % 2 == 0:
        return (lst[len(lst) // 2] + lst[len(lst) // 2 - 1]) / 2
    else:
        return lst[len(lst) // 2]


if __name__ == '__main__':
    main()
