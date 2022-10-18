import math

def main():
    print("""Introduza as coordenadas (x, y) do dardo.
Representa as posicoes horizontal e vertical respetivamente.
Ambas em milimetros.
    """)

    x = int(input('X: '))
    y = int(input('Y: '))

    mod = math.sqrt(x ** 2 + y ** 2)

    if mod > 170:
        print('Fora do alvo.')
        exit(1)

    if mod < 12.7:
        print('Pontuacao: 50 pontos.')
        exit(1)
    elif mod < 32:
        print('Pontuacao: 25 pontos.')
        exit(1)

    base_point = BasePoint(x, y)

    if mod > 99 and mod < 107:
        print('Pontuacao: {}pontos.'.format(base_point * 3))
        exit(1)
    if mod > 162:
        print('Pontuacao: {}pontos.'.format(base_point * 2))
        exit(1)

    print('Pontuacao: {}pontos.'.format(base_point))
    exit(1)

def BasePoint(x, y):
    if x > 0:
        if abs(y) < x * math.tan(math.pi / 20):
            return 6
        else:
            if y > 0:
                if y < x * math.tan(3 * math.pi / 20):
                    return 13
                if y < x * math.tan(5 * math.pi / 20):
                    return 4
                if y < x * math.tan(7 * math.pi / 20):
                    return 18
                if y < x * math.tan(9 * math.pi / 20):
                    return 1
                else:
                    return 20
            else:
                if y > x * math.tan(-3 * math.pi / 20):
                    return 10
                if y > x * math.tan(-5 * math.pi / 20):
                    return 15
                if y > x * math.tan(-7 * math.pi / 20):
                    return 2
                if y > x * math.tan(-9 * math.pi / 20):
                    return 17
                else:
                    return 3
    else:
        if abs(y) < x * math.tan(math.pi + math.pi / 20):
            return 6
        else:
            if y > 0:
                if y < x * math.tan(math.pi + 3 * math.pi / 20):
                    return 14
                if y < x * math.tan(math.pi + 5 * math.pi / 20):
                    return 9
                if y < x * math.tan(math.pi + 7 * math.pi / 20):
                    return 12
                if y < x * math.tan(math.pi + 9 * math.pi / 20):
                    return 5
                else:
                    return 20
            else:
                if y > x * math.tan(math.pi + -3 * math.pi / 20):
                    return 8
                if y > x * math.tan(math.pi + -5 * math.pi / 20):
                    return 16
                if y > x * math.tan(math.pi + -7 * math.pi / 20):
                    return 7
                if y > x * math.tan(math.pi + -9 * math.pi / 20):
                    return 19
                else:
                    return 3

if __name__ == '__main__':
    main()