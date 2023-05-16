tarifario_sec = 0.12 / 60

duracao = float(input('Introduza a duracao da chamada em segundos: '))

if duracao < 60:
    custo = 0.12
else:
    custo = duracao * tarifario_sec

print('Custo: ', custo)
