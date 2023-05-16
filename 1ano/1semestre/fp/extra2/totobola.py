"""
This code is in no way optimal.
A lot could be upgraded here.
"""


def main():
    budget = 0
    journeys = {}
    get_journeys(journeys, 'Jornadas.csv')
    get_user_input(journeys, budget)


def get_user_input(journeys: dict, budget: int) -> None:
    while True:
        journey_input = input('Jornada? ')
        if journey_input in journeys:
            break
        elif journey_input == '0':
            print(f"Saldo: {budget:.2f} euro")
            exit(0)
        else:
            print('Jornada inválida')

    match_id = 1
    true_bet_count = [0, 0]
    with open(f'apostas_jornadas/jornada{journey_input}.csv', 'w') as f:
        for match in journeys[journey_input]:
            while True:
                bet = input(f"{match_id} {match[0]} vs {match[1]}: ").upper()
                if bet in ['1', 'X', '2', '1X', 'X2', '12', '1X2']:
                    f.write(f"{match_id},{bet}\n")
                    match_id += 1
                    if len(bet) != 1:
                        true_bet_count[len(bet) - 2] += 1
                    break
                else:
                    print('Aposta inválida')

    budget -= 0.4 * (2 ** true_bet_count[0] * 3 ** true_bet_count[1])
    print_results(journeys, int(journey_input), budget)


def print_results(journeys: dict, journey: int, budget: int) -> None:
    with open(f'apostas_jornadas/jornada{journey}.csv', 'r') as f:
        bets = f.readlines()
        bets = [bet.strip().split(',') for bet in bets]
        bets = {bet[0]: bet[1] for bet in bets}

    with open('Jogos.csv', 'r') as f:
        games = f.readlines()
        print('Jornada', journey)
        line_id = 1
        right_bets_count = 0
        for match in journeys[str(journey)]:
            for game in games:
                game = game.strip().split(',')
                if game[1] == match[0] and game[2] == match[1]:
                    bet = bets[str(journeys[str(journey)].index(match) + 1)]
                    result = 'CERTO' if (
                            ('1' in bet and game[3] > game[4])
                            or ('X' in bet and game[3] == game[4])
                            or ('2' in bet and game[3] < game[4])
                    ) else 'ERRADO'
                    if result == 'CERTO':
                        right_bets_count += 1
                    print(f'{line_id} {match[0]:>30}  {game[3]}-{game[4]}  {match[1]:<30}: {bet:<5} ({result})')
            line_id += 1
        if right_bets_count < 7:
            price = 0
        elif right_bets_count < 8:
            price = 100
        elif right_bets_count < 9:
            price = 1000
        else:
            price = 5000
        print(
            f"TEM {right_bets_count} CERTAS. {'SEM PRÉMIO' if right_bets_count < 7 else ('3º PRÉMIO' if right_bets_count < 8 else ('2º PRÉMIO' if right_bets_count < 9 else '1º PRÉMIO'))}")
        budget += price

        get_user_input(journeys, budget)


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
