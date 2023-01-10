def onlyCaps(s):
    # NOTE: ch.isupper() -> True if ch is uppercase.
    if len(s) == 0:
        return ""
    if len(s) == 1:
        return s if s.isupper() else ""
    return s[0] + onlyCaps(s[1:]) if s[0].isupper() else onlyCaps(s[1:])


print(onlyCaps("John Fitzgerald Kennedy"))
print(onlyCaps(""))
