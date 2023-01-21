def score(guess, secret):
    assert len(guess) == len(secret)

    bulls_index: list[int] = []

    for i in range(len(guess)):
        if guess[i] == secret[i]:
            bulls_index.append(i)

    new_g: list[str] = [guess[i] for i in range(len(guess)) if i not in bulls_index]
    new_s: list[str] = [secret[i] for i in range(len(secret)) if i not in bulls_index]

    cows_index: list[int] = []
    for i in range(len(new_g)):
        for j in range(len(new_s)):
            if new_g[i] == new_s[j] and i not in cows_index:
                cows_index.append(i)

    return len(bulls_index), len(cows_index)
