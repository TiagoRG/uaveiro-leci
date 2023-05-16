"""
Complete onlyCaps(S) para devolver uma string que contenha apenas as letras maiúsculas da string S.
Por exemplo, onlyCaps("John Fitzgerald Kennedy") deve devolver "JFK".
A solução tem de ser recursiva e não pode usar ciclos.
"""


def onlyCaps(s):
    # NOTE: ch.isupper() -> True if ch is uppercase.
    return "" if len(s) == 0 else (s[0] + onlyCaps(s[1:]) if s[0].isupper() else onlyCaps(s[1:]))
