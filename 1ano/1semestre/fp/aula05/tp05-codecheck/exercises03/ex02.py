# Substitua as reticências pelo valor adequado para obter as respostas pedidas.

# Este tuplo define os nomes dos meses em Português:
MESESPT = ("janeiro", "fevereiro", "março", "abril", "maio", "junho",
           "julho", "agosto", "setembro", "outubro", "novembro", "dezembro")


# Complete a função para que, dado um tuplo (ano, mes, dia)
# devolva um data por extenso.
# Por exemplo, datePT((1938, 1, 22)) deve devolver "22 de janeiro de 1938".
def datePT(date):
    ano, mes, dia = date
    s = f"{str(dia)} de {MESESPT[mes - 1]} de {ano}"
    return s


# Complete a definição para converter uma data no formato "DD/MM/AAAA"
# num tuplo de inteiros com (ano, mês, dia).
# Por exemplo: parseDMY("25/12/2020") deve devolver (2020, 12, 25).
def parseDMY(s):
    # Sugestão: use o método split.
    parts = s.split('/')
    return (int(parts[2]), int(parts[1]), int(parts[0]))

# No CodeCheck estas funções são testadas com argumentos pré-programados.
# Se quiser testar offline, tem de acrescentar as suas intruções de chamada.

# JMR@ua.pt 2021
