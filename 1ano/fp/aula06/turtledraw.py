# Exercise 5 on "How to think like a computer scientist", ch. 11.

import turtle


def main():
    t = turtle.Turtle()

    # Use t.up(), t.down() and t.goto(x, y)

    # Put your code here
    with open("datafiles/drawing.txt", 'r') as f:
        for line in f.readlines():
            if line == "UP\n":
                t.up()
            elif line == "DOWN\n":
                t.down()
            else:
                x, y = line.split()
                t.goto(int(x), int(y))

    # wait
    turtle.Screen().exitonclick()


if __name__ == "__main__":
    main()
