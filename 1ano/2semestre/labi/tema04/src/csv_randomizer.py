import csv
import random


def main(args=None):
    with open("../datafiles/example2.csv", "w") as f:
        writer = csv.DictWriter(f, delimiter=",", fieldnames=["entry", "value"])

        writer.writeheader()

        for i in range(25):
            writer.writerow({"entry": i, "value": random.randint(0, 100)})


if __name__ == '__main__':
    main()
