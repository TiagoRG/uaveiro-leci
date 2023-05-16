def main():
    A = "reading"
    B = "eating"
    C = "traveling"
    D = "writing"
    E = "running"
    F = "music"
    G = "movies"
    H = "programming"

    interests = {
        "Marco": {A, D, E, F},
        "Anna": {E, A, G},
        "Maria": {G, D, E},
        "Paolo": {B, D, F},
        "Frank": {D, B, E, F, A},
        "Teresa": {F, H, C, D}
    }

    print("a) Table of common interests:")
    commoninterests = {(p1, p2): interests[p1].intersection(interests[p2])
                       for p1 in interests for p2 in interests
                       if list(interests.keys()).index(p1) < list(interests.keys()).index(p2)}
    print(commoninterests)

    print("b) Maximum number of common interests:")
    maxCI = max([len(interest) for interest in commoninterests.values()])
    print(maxCI)

    print("c) Pairs with maximum number of matching interests:")
    maxmatches = [pair for pair, interest in commoninterests.items() if len(interest) == maxCI]
    print(maxmatches)

    print("d) Pairs with low similarity:")
    lowJaccard = [(p1, p2) for p1 in interests for p2 in interests
                  if (p1 != p2 and list(interests.keys()).index(p1) < list(interests.keys()).index(p2))
                  and len(interests[p1].intersection(interests[p2])) / len(interests[p1].union(interests[p2])) < 0.25]
    print(lowJaccard)


# Start program:
if __name__ == "__main__":
    main()
