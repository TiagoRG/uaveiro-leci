import calendar
from datetime import datetime;

nome = input('Como te chamas? ')
anoNascenca = int(input('Em que ano nasceste? '))
ano = int(input('Ano para verificar: '))

print('{}, em {} farás {} anos.'.format(nome, ano, ano - anoNascenca))