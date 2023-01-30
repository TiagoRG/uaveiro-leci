def allMatches(teamList):
    matchList = []

    for team1 in teamList:
        for team2 in teamList:
            if team1 != team2:
                matchList.append((team1, team2))

    return matchList
