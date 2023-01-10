def unload(t, m, q):
    for v in t[::-1]:
        if v[0] != m:
            continue
        while v[1] > 0 and q > 0:
            v[1] -= 1
            q -= 1
        if v[1] == 0:
            t.remove(v)
    return q
