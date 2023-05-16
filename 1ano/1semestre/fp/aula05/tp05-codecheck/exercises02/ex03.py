# Substitua as reticências pelo valor adequado para obter as respostas pedidas.

# Complete a função match(t1, t2, g1, g2) para
# registar o resultado de um jogo entre duas equipas de futebol.
# t1 e t2 são listas com [nome, vitórias, empates, derrotas] das duas equipas.
# g1 e g2 são os golos marcados por cada uma delas.
# A função não precisa de devolver um resultado,
# mas tem de alterar os conteúdos de t1 e t2.
def match(t1, t2, g1, g2):
    print(t1[0], g1, ':', g2, t2[0])
    if g1 > g2:
        t1[1] += 1
        t2[3] += 1
    elif g1 < g2:
        t1[3] += 1
        t2[1] += 1
    else:
        t1[2] += 1
        t2[2] += 1


def test():
    team1 = ["Ajax", 0, 0, 0]
    team2 = ["Benfica", 0, 0, 0]
    team3 = ["Juventus", 0, 0, 0]
    print(team1, team2, team3)

    match(team1, team2, 2, 1)
    print(team1, team2, team3)
    match(team2, team3, 1, 1)
    print(team1, team2, team3)
    match(team3, team1, 0, 3)
    print(team1, team2, team3)


# Run tests:
test()

# JMR@ua.pt 2021
