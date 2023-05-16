def main() -> None:
    calls = {}

    while True:
        print("""1) Registar chamada
2) Ler ficheiro
3) Listar clientes
4) Fatura
5) Terminar""")
        op = input("Opção? ")
        if op == "1":
            registar_chamada(calls)
        elif op == "2":
            fname = input("Ficheiro? ")
            ler_ficheiro(calls, fname)
        elif op == "3":
            listar_clientes(calls)
        elif op == "4":
            phone_number = input("Telefone? ")
            fatura(calls, phone_number)
        elif op == "5":
            exit(0)
        else:
            print("Opção inválida\n")


def registar_chamada(calls: dict) -> None:
    caller_phone_number = input("Telefone origem? ")
    while not validate_phone_number(caller_phone_number):
        caller_phone_number = input("Telefone origem? ")

    destination_phone_number = input("Telefone destino? ")
    while not validate_phone_number(destination_phone_number):
        destination_phone_number = input("Telefone destino? ")

    duration = input("Duração (s)? ")
    while not duration.isdigit():
        duration = input("Duração (s)? ")
    duration = int(duration)

    if caller_phone_number not in calls:
        calls[caller_phone_number] = {}
    if destination_phone_number not in calls[caller_phone_number]:
        calls[caller_phone_number][destination_phone_number] = []
    calls[caller_phone_number][destination_phone_number] += [int(duration)]


def ler_ficheiro(calls: dict, fname: str) -> None:
    try:
        with open(fname, 'r') as f:
            for line in f:
                line = line.strip()
                if line:
                    caller_phone_number, destination_phone_number, duration = line.split('\t')

                    if caller_phone_number not in calls:
                        calls[caller_phone_number] = {}
                    if destination_phone_number not in calls[caller_phone_number]:
                        calls[caller_phone_number][destination_phone_number] = []
                    calls[caller_phone_number][destination_phone_number] += [int(duration)]

    except FileNotFoundError:
        print("Ficheiro não encontrado\n")


def listar_clientes(calls: dict) -> None:
    print("Clientes:", end='\t')
    for caller_phone_number in calls:
        print(caller_phone_number, end='\t')
    print()


def fatura(calls: dict, phone_number: str) -> None:
    if phone_number not in calls:
        print("Cliente não existe\n")
        return

    total = 0

    print("Fatura do cliente", phone_number)
    print(f"{'Destino':<15}{'Duração':>10}{'Custo':>10}")

    for destination_phone_number in calls[phone_number]:
        for duration in calls[phone_number][destination_phone_number]:
            if destination_phone_number.startswith("+"):
                call_cost = duration * 0.8 / 60
            elif destination_phone_number.startswith("2"):
                call_cost = duration * 0.02 / 60
            elif phone_number[:2] == destination_phone_number[:2]:
                call_cost = duration * 0.04 / 60
            else:
                call_cost = duration * 0.1 / 60

            total += call_cost
            print(f"{destination_phone_number:<20}{duration:>10}{call_cost:>12.2f}")

    print(f"{'Total':>30}{total:>12.2f}")


def validate_phone_number(phone_number: str) -> bool:
    return phone_number.isdigit() and len(phone_number) >= 3 if phone_number[0] != "+" else phone_number[
                                                                                            1:].isdigit() and len(
        phone_number[1:]) >= 3


if __name__ == '__main__':
    main()
