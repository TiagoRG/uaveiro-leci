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
        if i == 0 or s[i] != s[i-1]:
            new += s[i]
    return new


def reapeatNumTimes(n):
    lst = []
    for i in range(1, n+1):
        for j in range(i):
            lst.append(i)
    return lst


def positionOfFirstLargest(arr):
    mx = maxArray(arr)
    for index, a in enumerate(arr):
        if a == mx:
            return index


def maxArray(arr):
    mx = arr[0]
    for a in arr:
        if a > mx:
            mx = a
    return mx


if __name__ == "__main__":
    main()
