from extras.allMatches import *  # importa a função allMatches criada na aula05


def main():
    equipas = getTeams()                                                       # pede as equipas ao utilizador
    partidas = allMatches(equipas)                                             # cria a lista de partidas
    resultados = getResults(partidas)                                          # pede os resultados ao utilizador
    tabela = getTable(equipas, resultados)                                     # cria a tabela de classificação
    printTable(tabela)                                                         # imprime a tabela de classificação


def getTeams():
    teams = []                                                                 # cria uma lista vazia para as equipas

    while True:                                                                # Ciclo para obter as equipas
        team = input("Nome da equipa: ")
        if team == "" and len(teams) < 2:
            continue
        elif team == "":
            break
        teams.append(team)

    return teams


def getResults(matches):
    results = dict()                                                           # cria um dicionário vazio para os resultados
    for match in matches:
        team1, team2 = match                                                   # desempacota a partida
        print("Resultado do jogo entre", team1, "e", team2)
        goals1 = int(input("Golos da equipa 1: "))
        goals2 = int(input("Golos da equipa 2: "))
        results[match] = (goals1, goals2)                                      # adiciona o resultado ao dicionário
    return results


def getTable(teams, results):
    table = dict()                                                             # cria um dicionário vazio para a tabela
    for team in teams:
        table[team] = [0, 0, 0, 0, 0, 0]                                       # inicializa a tabela com zeros
    for match in results:
        team1, team2 = match                                                   # desempacota a partida
        goals1, goals2 = results[match]                                        # desempacota os resultados
        if goals1 > goals2:                                                    # se a equipa 1 ganhou
            # atualiza os resultados da equipa 1
            table[team1][0] += 1
            table[team1][3] += goals1
            table[team1][4] += goals2
            table[team1][5] += 3

            # atualiza os resultados da equipa 2
            table[team2][2] += 1
            table[team2][3] += goals2
            table[team2][4] += goals1
        elif goals2 > goals1:                                                  # se a equipa 2 ganhou
            # atualiza os resultados da equipa 2
            table[team2][0] += 1
            table[team2][3] += goals2
            table[team2][4] += goals1
            table[team2][5] += 3

            # atualiza os resultados da equipa 1
            table[team1][2] += 1
            table[team1][3] += goals1
            table[team1][4] += goals2
        else:                                                                  # se houve empate
            # atualiza os resultados da equipa 1
            table[team1][1] += 1
            table[team1][3] += goals1
            table[team1][4] += goals2
            table[team1][5] += 1

            # atualiza os resultados da equipa 2
            table[team2][1] += 1
            table[team2][3] += goals2
            table[team2][4] += goals1
            table[team2][5] += 1

    sortedTable = sortTable(table)                                             # ordena a tabela por pontos e diferença de golos
    return sortedTable


def printTable(table):

    print(f"\n{'Equipa':<15}\tV\tE\tD\tGM\tGS\tPts")

    for results in table:
        print(f"{results:<15}", end="\t")

        for result in table[results]:
            print(result, end="\t")

        print('')

    print(f"\nA equipa campeã é {max(table, key=lambda x: (table[x][3]- table[x][4]))}.")


def sortTable(table):
    pointsOrder = []                                                           # cria uma lista vazia para a ordenação por pontos
    for team in table:
        pointsOrder.append(table[team][5])                                     # adiciona os pontos à lista
    pointsOrder.sort()                                                         # ordena a lista de pontos (ordem crescente)

    resultsByPoints = {}                                                       # cria um dicionário vazio para os resultados ordenados por pontos
    for points in pointsOrder:                                                 # percorre a lista de pontos
        for team in table:                                                     # percorre as equipas
            if table[team][5] == points:                                       # se a equipa tiver os pontos
                resultsByPoints[team] = table[team]                            # adiciona a equipa ao dicionário

    goalDiffByTeam = {}                                                        # cria um dicionário vazio para a diferença de golos por equipa
    for team in table:                                                         # percorre as equipas
        goalDiffByTeam[team] = table[team][3] - table[team][4]                 # calcula a diferença de golos da equipa e adiciona ao dicionário

    teamOrder = []                                                             # cria uma lista vazia para a ordenação dos nomes das equipas por diferença de golos
    for team1 in resultsByPoints:
        for team2 in resultsByPoints:
            if resultsByPoints[team1][5] == resultsByPoints[team2][5]:         # se as equipas tiverem os mesmos pontos

                if goalDiffByTeam[team1] >= goalDiffByTeam[team2]:             # se a diferença de golos da equipa 1 for maior ou igual à da equipa 2
                    teamOrder.append(team1)                                    # adiciona a equipa 1 à lista

                else:                                                          # se a diferença de golos da equipa 2 for maior
                    teamOrder.append(team2)                                    # adiciona a equipa 2 à lista

    teamOrder = teamOrder[::-1]                                                # inverte a lista de equipas (ordem decrescente em diferença de golos)
    resultsByGoalDiff = {}                                                     # cria um dicionário vazio para os resultados ordenados por diferença de golos
    for team in teamOrder:
        resultsByGoalDiff[team] = resultsByPoints[team]                        # adiciona os resultados da equipa ao dicionário ordenado por diferença de golos

    return resultsByGoalDiff


if __name__ == '__main__':
    main()
