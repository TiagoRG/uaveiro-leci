import math

from extras.allMatches import *  # importa a função allMatches criada na aula05


def main():
    equipas = getTeams()  # pede as equipas ao utilizador
    partidas = allMatches(equipas)  # cria a lista de partidas
    resultados = getResults(partidas)  # pede os resultados ao utilizador
    tabela = getTable(equipas, resultados)  # cria a tabela de classificação
    printTable(tabela)  # imprime a tabela de classificação


def getTeams():
    teams = []  # cria uma lista vazia para as equipas
    while True:  # Ciclo para obter as equipas
        team = input("Nome da equipa: ")
        if team in teams:  # Garante não haver equipas repetidas
            continue
        if team == "":
            if len(teams) < 2:
                continue
            else:
                break
        teams.append(team)
    return teams


def getResults(matches):
    results = dict()  # cria um dicionário vazio para os resultados
    for match in matches:
        team1, team2 = match  # desempacota a partida
        print("Resultado do jogo entre", team1, "e", team2)
        goals1 = int(input("Golos da equipa 1: "))
        goals2 = int(input("Golos da equipa 2: "))
        results[match] = (goals1, goals2)  # adiciona o resultado ao dicionário
    return results


def getTable(teams, results):
    table = dict()  # cria um dicionário vazio para a tabela

    for team in teams:
        table[team] = [0, 0, 0, 0, 0, 0]  # inicializa a tabela com as equipas a zeros

    for match in results:
        team1, team2 = match  # desempacota a partida
        goals1, goals2 = results[match]  # desempacota os resultados

        # atualiza os resultados da equipa 1
        updateStats(table, team1, goals1, goals2)

        # atualiza os resultados da equipa 2
        updateStats(table, team2, goals2, goals1)

    # devolve a tabela ordenada por pontos, diferença de golos e por último por golos marcados.
    return {team: table[team] for team in
            sorted(table, key=lambda x: (table[x][5], table[x][3] - table[x][4], table[x][3]), reverse=True)}


def updateStats(table, team, gm, gs):
    table[team][5] += (
        points := 1 if gm == gs else (3 if gm > gs else 0))  # calcula os pontos a atribuir à equipa e adiciona à tabela
    table[team][math.trunc(2 - points / 2)] += 1  # determina o index ao qual atribui o jogo (V/E/D)
    table[team][3] += gm  # adiciona os golos marcados
    table[team][4] += gs  # adiciona os golos marcados


def printTable(table):
    print(f"\n{'Equipa':<15}\tV\tE\tD\tGM\tGS\tPts")

    for team in table:
        print(f"{team:<15}", end="\t")

        for team_stat in table[team]:
            print(team_stat, end="\t")

        print('')

    print(f"\nA equipa campeã é {list(table.keys())[0]}.")


if __name__ == '__main__':
    main()
