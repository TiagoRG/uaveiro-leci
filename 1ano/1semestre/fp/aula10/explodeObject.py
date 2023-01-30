def explodeObject(name, obj):
    """Print the name and representation (repr) of an object,
   followed by the name and representation of each of its elements,
   if the object is a list, tuple or dict.
   """
    print(f"{name} = {obj!r}")  # !r converts object to its repr!
    # print("{} = {!r}".format(name, obj))    # equivalent

    if type(obj) in (list, tuple, set):  # if obj is a list, tuple or set...
        for i, item in enumerate(obj):
            explodeObject(f"{name}[{i}]", item)
    elif type(obj) is dict:  # if obj is a dict...
        for key, value in obj.items():
            explodeObject(f"{name}[{key!r}]", value)
    # call recursively for each of its elements
    # Then do something similar for tuples and dicts


def main():
    obj1 = [1, ["a", ["b", 2], 3], 4]
    obj2 = [1, "ola", (2, [[3, 4], 5, ("adeus", 6)], 7)]
    obj3 = [1, {"ola": "hello", "adeus": ["bye", "adieu"]}, (2, [[3, 4], 5], 6)]
    eval(input())


if __name__ == "__main__":
    main()
