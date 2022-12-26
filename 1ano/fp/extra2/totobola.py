def main():
    journeys = {}
    get_journeys(journeys, 'Jornadas.csv')
    get_user_input(journeys)


def get_user_input(journeys: dict) -> None:
    while True:
        journey_input = input('Jornada? ')
        if journey_input in journeys:
            break
        else:
            print('Jornada inválida')

    match_id = 1
    with open(f'apostas_jornadas/jornada{journey_input}.csv', 'w') as f:
        for match in journeys[journey_input]:
            while True:
                bet = input(f"{match_id} {match[0]} vs {match[1]}: ")
                if bet in ['1', 'x', 'X', '2']:
                    f.write(f"{match_id},{bet if bet != 'x' else 'X'}\n")
                    match_id += 1
                    break
                else:
                    print('Aposta inválida')

    print_results(journeys, int(journey_input))


def print_results(journeys: dict, journey: int) -> None:
    with open(f'apostas_jornadas/jornada{journey}.csv', 'r') as f:
        bets = f.readlines()
        bets = [bet.strip().split(',') for bet in bets]
        bets = {bet[0]: bet[1] for bet in bets}

    with open('Jogos.csv', 'r') as f:
        games = f.readlines()
        print('Jornada', journey)
        line_id = 1
        for match in journeys[str(journey)]:
            for game in games:
                game = game.strip().split(',')
                if game[1] == match[0] and game[2] == match[1]:
                    bet = bets[str(journeys[str(journey)].index(match)+1)]
                    result = 'CERTO' if (
                        (bet == '1' and game[3] > game[4])
                        or (bet == 'X' and game[3] == game[4])
                        or (bet == '2' and game[3] < game[4])
                    ) else 'ERRADO'
                    print(f'{line_id} {match[0]:>30}  {game[3]}-{game[4]}  {match[1]:<30}: {bet}    ({result})')
            line_id += 1


def get_journeys(journeys: dict, fname: str) -> None:
    with open(fname, 'r') as f:
        lines = f.readlines()
        for line in lines:
            line = line.strip()
            line_components = line.split(',')
            if line_components[0] in journeys:
                journeys[line_components[0]] += [(line_components[1], line_components[2])]
            else:
                journeys[line_components[0]] = [(line_components[1], line_components[2])]


if __name__ == "__main__":
    main()
