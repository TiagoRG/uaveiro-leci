import os


def printDirFiles(d):
    lst = os.listdir(d)
    for fname in lst:
        path = os.path.join(d, fname)
        if os.path.isfile(path):
            ftype = "FILE"
        elif os.path.isdir(path):
            ftype = "DIR"
        else:
            ftype = "?"
        print(ftype, path)
    return


def findFiles(path, ext) -> list:
    # Complete...
    if not os.path.isdir(path):
        if ext == path[-len(ext):]:
            return [path.split('/')[-1][:-len(ext)]]
        return []

    lst = []
    for fname in os.listdir(path):
        d = os.path.join(os.path.abspath(path), fname)
        lst += findFiles(d, ext)
    return lst


def main():
    print("Testing printDirFiles('..'):")
    printDirFiles("..")

    print("\nTesting findFiles('.', '.py'):")
    lst = findFiles(".", ".py")
    print(lst)
    assert isinstance(lst, list)

    print("\nTesting findFiles('..', '.csv'):")
    lst = findFiles("..", ".csv")
    print(lst)
    assert isinstance(lst, list)


if __name__ == "__main__":
    main()
