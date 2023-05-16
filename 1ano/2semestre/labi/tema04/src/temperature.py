import csv

temperaturas = []  # lista vazia para armazenar as temperaturas

# leitura do arquivo CSV
with open('weather.csv', newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=',', quotechar='"')
    next(reader)  # pula a primeira linha (cabeçalho)
    for row in reader:
        temperatura = float(row[2])
        temperaturas.append(temperatura)

# cálculo do máximo, mínimo e médio
maximo = max(temperaturas)
minimo = min(temperaturas)
media = sum(temperaturas) / len(temperaturas)

# exibição dos resultados
print(f"Máximo: {maximo}")
print(f"Mínimo: {minimo}")
print(f"Média: {media}")
