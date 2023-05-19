def main():
    matches = allMatches(['SLB', 'FCP', 'SCP', 'SB'])
    print(matches)
    print(len(matches))


def allMatches(teamList):
    matchList = []

    for team1 in teamList:
        for team2 in teamList:
            if team1 != team2:
                matchList.append((team1, team2))

    return matchList


if __name__ == "__main__":
    main()
