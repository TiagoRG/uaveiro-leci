CTP = float(input('Componente Teorica-pratica: '))
CP = float(input('Componente Pratica: '))

NF = round(0.3 * CTP + 0.7 * CP)

if (CTP < 6.6) or (CP < 6.6):
    print('Reprovado por nota minima!\n')
elif NF >= 10:
    print('Aprovado com nota {}'.format(NF))
    exit(1)

ATPR = float(input('Componente Teorica-pratica de recurso: '))
ATP = float(input('Componente Pratica de recurso: '))
NF = round(0.3 * ATPR + 0.7 * ATP)
if NF >= 10:
    print('Aprovado com nota ', NF)
else:
    print('Continua reprovado, nota ', NF)
