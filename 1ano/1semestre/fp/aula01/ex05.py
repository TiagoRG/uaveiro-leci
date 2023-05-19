from math import *

A = float(input('Comprimento do cateto A: '))
B = float(input('Comprimento do cateto B: '))

C = sqrt(A ** 2 + B ** 2)

cosseno = A / C
angRad = acos(cosseno)
angDeg = angRad * 180 / pi

print(
    f'O comprimento da hipotenusa é {round(C, 2)} e o valor do angulo entre o cateto A e a hipotenusa é {round(angDeg, 2)}°')
