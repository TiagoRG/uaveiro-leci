import csv
import sys


def main(args=None):
    with open(args[0], 'r') as f:
        reader = csv.reader(f, delimiter=(',' if len(args) == 1 else args[1]))
        for row in reader:
            print(row)


if __name__ == '__main__':
    main(sys.argv[1:])
