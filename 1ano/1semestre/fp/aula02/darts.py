import math

POINTS = (6, 13, 4, 18, 1, 20, 5, 12, 9, 14, 11, 8, 16, 7, 19, 3, 17, 2, 15, 10)

print(
    "Introduza as coordenadas (x, y) do dardo.\nRepresenta as posicoes horizontal e vertical respetivamente.\nAmbas em milimetros.")

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

angleRad = math.atan2(y, x)
angleDeg = math.degrees(angleRad) - 9
score = POINTS[int(angleDeg / 20)]

if 99 < mod < 107:
    score *= 3
if mod > 162:
    score *= 2

print(f'Pontuacao: {score} pontos.')
exit(1)
