def main():
    print(evenThenOdd('abcd'))
    print(removeAdjacentDuplicates('mississipi'))
    print(reapeatNumTimes(4))
    print(positionOfFirstLargest([1, 624, 123, 34, 12]))


def evenThenOdd(string):
    even = ''
    odd = ''
    for index, char in enumerate(string):
        if index % 2 == 0:
            even += char
        else:
            odd += char
    return even + odd


def removeAdjacentDuplicates(s):
    new = ''
    for i in range(len(s)):
        if i == 0 or s[i] != s[i - 1]:
            new += s[i]
    return new


def reapeatNumTimes(n):
    lst = []
    for i in range(1, n + 1):
        lst += [i] * i
    return lst


def positionOfFirstLargest(arr):
    mx = arr[0]
    index = 0
    for i, a in enumerate(arr):
        if a > mx:
            mx = a
            index = i
    return index


if __name__ == "__main__":
    main()
