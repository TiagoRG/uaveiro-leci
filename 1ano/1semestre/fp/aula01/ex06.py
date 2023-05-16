from math import sqrt

x1, y1 = input("Introduza x1 e y1, separados por uma virgula ',': ").split(',')
x2, y2 = input("Introduza x2 e y2, separados por uma virgula ',': ").split(',')

x1 = float(x1)
y1 = float(y1)
x2 = float(x2)
y2 = float(y2)

distancia = sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2)

print('A distancia entre os dois pontos é: ', distancia)
