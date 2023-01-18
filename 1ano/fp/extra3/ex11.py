def onlyCaps(s):
    # NOTE: ch.isupper() -> True if ch is uppercase.
    return (s if len(s) == 0 or (len(s) == 1 and s.isupper()) else "") if len(s) <= 1 else (s[0] + onlyCaps(s[1:]) if s[0].isupper() else onlyCaps(s[1:]))

