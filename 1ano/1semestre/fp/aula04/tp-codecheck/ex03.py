# Example: Print a multiplication table
# Like:
#   1 x 1  =   1
#   1 x 2  =   2
#   ...
#  10 x 10 = 100
#
# Make the program print an empty line after each group of ten.
# Also, use format specifiers to align the numbers.
#
# JMR 2019   

def main():
    for i in range(1, 11):
        table(i)
        print()


def table(n):
    for i in range(1, 11):
        print(f'{n} x {i} = {n * i}')


if __name__ == "__main__":
    main()
