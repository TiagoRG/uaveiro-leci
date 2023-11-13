import random
from wordlist import words1, words2


def main():
    # Descomente a linha que interessar para testar
    words = words1             # palavras sem acentos nem cedilhas.
    words = words2             # palavras com acentos ou cedilhas.
    words = words1 + words2    # palavras de ambos os tipos

    # Escolhe palavra aleatoriamente
    secret = random.choice(words).upper()

    # Complete o programa

    # Inicializa o contador de erros a 0
    errors: int = 0

    # Initializa a lista vazia de letras usadas
    used_letters: list[str] = []

    # Obtém a string da palavra escondida inicial
    hidden_secret, valid_letter = get_hidden("", secret, used_letters)

    while True:
        # Apresenta o display
        print('\033c', end='')
        print(get_hangman(errors), end='\n\n')
        print(f"\nPalavra: {hidden_secret}")
        print(f"\nLetras usadas: {' '.join(used_letters)}")
        print(f"\nErros: {errors}")

        # Se a palavra escondida for igual à descoberta até ao momento,
        # informa que descobriu, mostra o número de erros e sai do programa
        if hidden_secret.replace(' ', '') == secret:
            print(f"\n\nAcertou! A palavra era {secret}. Teve {errors} erros.")
            exit(0)

        # Se chegar a 7 erros para o programa
        if errors == 7:
            print(f"\nNão acertou, a palavra era: {secret}")
            exit(0)

        # Pede a próxima letra ao utilizador
        next_letter: str = input("\nAposta? ").upper()

        # Se a letra já tiver sido usada ou não é uma letra, ignora e avança
        if next_letter in used_letters or not next_letter.isalpha():
            continue

        # Adiciona a letra à lista
        used_letters.append(next_letter)

        # Obtém a nova palavra atual e verifica se a letra existia na secreta
        hidden_secret, valid_letter = get_hidden(
            hidden_secret, secret, used_letters)

        # Se a letra não existia na palavra secreta, adiciona 1 erro
        if not valid_letter:
            errors += 1


def get_hidden(
        current_hidden: str, secret: str, used_letters: list[str]
) -> tuple[str, bool]:
    """
    Obtém a palavra descoberta até ao momento e valida a última letra testada.
    """

    # Dicionário com as letras acentuadas
    letters = {
        'A': {'Á', 'À', 'Ã'},
        'E': {'É', 'Ẽ', 'Ê'},
        'I': {'Í'},
        'O': {'Ó', 'Õ', 'Ô'},
        'U': {'Ú'},
        'C': {'Ç'}
    }

    # Reinicializa a palavra descoberta
    hidden_secret = ""

    # Verifica todas as letras da palavra secreta
    for i in range(len(secret)):
        # Inicializa uma variável para saber se algum caractér foi adicionado
        added_char = False

        # Testa os caractéres acentuados no dicionário letters
        for key, value in letters.items():
            if secret[i] in value and key in used_letters:
                hidden_secret += f"{secret[i]} "
                added_char = True

        # Testa a letra apostada
        if secret[i] in used_letters:
            hidden_secret += f"{secret[i]} "
            added_char = True

        # Se não tiver sido adicionada nenhuma letra, adiciona um underscore
        if not added_char:
            hidden_secret += "_ "

    # Retorna a nova palavra descoberta e se houve mudança
    # (se a letra não era válida, a palavra mantém-se igual)
    return hidden_secret, hidden_secret != current_hidden


def get_hangman(errors: int) -> str:
    """
    Obtém o desenho da forca baseado no número de erros.
    """
    hangman = "_____\n|   |\n|"

    if errors == 0:
        hangman += "\n|\n|"
    elif errors == 1:
        hangman += "   o\n|\n|"
    elif errors == 2:
        hangman += "   o\n|   |\n|"
    elif errors == 3:
        hangman += "   o\n|  /|\n|"
    elif errors == 4:
        hangman += "   o\n|  /|\\\n|"
    elif errors == 5:
        hangman += "   o\n|  /|\\\n|  /"
    elif errors >= 6:
        hangman += "   o\n|  /|\\\n|  / \\"

    hangman += "\n|_______"
    return hangman


if __name__ == "__main__":
    main()
