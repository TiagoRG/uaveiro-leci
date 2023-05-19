"""
No jogo Bulls-and-Cows, o jogador tenta descobir um código secreto composto por N símbolos de um alfabeto pequeno, por exemplo algarismos ou letras.
Em cada tentativa, o jogador introduz N símbolos e o computador dá uma pontuação que indica quantos símbolos estão certos na posição certa (os Bulls)
e quantos estão certos, mas na posição errada (as Cows).
Por exemplo, se o segredo for '4271', a tentativa '1234' tem uma pontuação de 1 Bull (o ‘2’) e 2 Cows (‘1’ e ‘4’).

Complete a função score(guess, secret) para devolver a pontuação de uma tentativa. Por exemplo, score('1234', '4271') deve devolver (1, 2).
"""


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
