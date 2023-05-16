# This program uses the module turtle to draw "turtle graphics"
# For an introduction and examples, read
# https://runestone.academy/runestone/static/thinkcspy/PythonTurtle/toctree.html
# For a summary of the available methods:
# https://runestone.academy/runestone/books/published/thinkcspy/PythonTurtle/SummaryofTurtleMethods.html

import turtle  # allows us to use the turtles library


# Make turtle t draw a square with the given side length
def square(t, side):
    for n in range(4):
        t.forward(side)
        t.left(90)


# Make turtle t draw a spiral.
# The first side should have length = start, the second start+incr, etc.,
# until the length reaches length=end (exclusive).
def spiral(t, start, end, incr):
    if start < end:
        while start <= end:
            t.forward(start)
            t.left(90)
            start += incr
    else:
        while start >= end:
            t.forward(start)
            t.left(90)
            start += incr


def main():
    print("This program opens a window with a graphical user interface.")
    wn = turtle.Screen()  # creates a graphics window
    alex = turtle.Turtle()  # create a turtle named alex

    alex.forward(150)  # tell alex to move forward by 150 units
    alex.right(90)  # turn by 90 degrees
    alex.forward(75)  # complete the second side

    beth = turtle.Turtle()  # another turtle
    beth.shape("turtle")  # with another shape
    beth.color("blue")  # and color
    beth.up()  # pen up
    beth.goto(-200, -100)  # move to given point
    beth.down()  # pen down
    square(beth, 100)  # draw a square

    # This should draw a spiral
    alex.up()
    alex.goto(-200, 200)
    alex.setheading(0)
    alex.down()
    spiral(alex, 10, 200, 10)
    alex.up()
    alex.goto(100, 100)
    alex.setheading(0)
    alex.down()
    spiral(alex, 200, 0, -5)

    turtle.exitonclick()  # wait for a button click, then close window
    print("The window was closed. Bye!")


if __name__ == "__main__":
    main()
