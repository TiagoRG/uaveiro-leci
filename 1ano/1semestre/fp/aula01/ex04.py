secs = int(input('Segundos a converter para horas, minutos e segundos? '))
s = secs % 60
mins = secs // 60
m = mins % 60
h = mins // 60

print("{:02d}:{:02d}:{:02d}".format(h, m, s))
