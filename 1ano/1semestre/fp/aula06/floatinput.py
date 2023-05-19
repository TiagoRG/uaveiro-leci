import math


def floatInput(prompt, min=-math.inf, max=math.inf):
    assert min < max, 'ERROR: O valor mínimo é superior ao máximo!'
    try:
        res = float(input(prompt))
        if (res < min) or (res > max):
            print(f"ERROR: Value should be in [{min}, {max}]!")
            floatInput(prompt, min, max)
        return res
    except ValueError:
        print("ERROR: Not a float!")
        floatInput(prompt)


def main():
    print("a) Try entering invalid values such as 1/2 or 3,1416.")
    v = floatInput("Value? ")
    print("v:", v)

    print("b) Try entering invalid values such as 15%, 110 or -1.")
    h = floatInput("Humidity (%)? ", 0, 100)
    print("h:", h)

    print("c) Try entering invalid values such as 23C or -274.")
    t = floatInput("Temperature (Celsius)? ", min=-273.15)
    print("t:", t)

    # d) What happens if you uncomment this?
    # impossible = floatInput("Value in [3, 0]? ", min=3, max=0)

    return


if __name__ == "__main__":
    main()
