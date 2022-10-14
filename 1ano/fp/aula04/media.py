values = []

def GetValues():
    c = 1
    while True:
        n = input('n{}: '.format(c))
        if n == "": break
        values.append(float(n))
        c += 1

def GetMedia(val):
    total = 0
    for v in val:
        total += v
    return total / len(val)

def main():
    GetValues()
    print('Média dos valores introduzidos: ', GetMedia(values))

main()