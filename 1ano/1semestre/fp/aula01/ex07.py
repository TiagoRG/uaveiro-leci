A = 3
M = 2

viagensDia = 2 * M * sum(i for i in range(1, A + 1))
viagensAno = viagensDia * 365

mAno = viagensAno * 3
kmAno = mAno / 1000

secsAno = mAno
hAno = secsAno / 3600

print(f'O elevador anda {kmAno} kilometros por ano, durante {hAno} horas.')
