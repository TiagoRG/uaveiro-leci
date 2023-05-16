# Este programa demonstra a leitura e utilização de dados de um ficheiro JSON
# com mensagens do Twitter.
# Modifique-o para resolver o problema proposto.


# O módulo json permite descodificar ficheiros no formato JSON.
# São ficheiros de texto que armazenam objetos compostos que podem incluir
# números, strings, listas e/ou dicionários.
import json

# Abre o ficheiro e descodifica-o criando o objeto twits.
with open("twitter.json", encoding="utf8") as f:
    twits = json.load(f)

# Analise os resultados impressos para perceber a estrutura dos dados.
print(type(twits))  # deve indicar que é uma lista!
print(type(twits[0]))  # cada elemento da lista é um dicionário.
print(twits[0].keys())  # mostra as chaves no primeiro elemento.

# Cada elemento contém uma mensagem associada à chave "text":
print(twits[0]["text"])

# Algumas mensagens contêm hashtags:
print(twits[880]["text"])

# A)
word_count: dict[str, int] = {}

for tweet in twits:
    tweet_content: str = tweet["text"]
    for word in tweet_content.split():
        if word not in word_count:
            word_count[word] = 0
        word_count[word] += 1

word_list = list(word_count.keys())

print("A)\n" + str(word_list), end="\n\n")

# B)

ordered_list = sorted(word_list, key=lambda t: word_count[t], reverse=True)
print("B)\n" + str(ordered_list), end="\n\n")

# C)

ordered_hashtag_list = [word for word in ordered_list if word.startswith('#')]
print("C)\n" + str(ordered_hashtag_list), end="\n\n")

# D)
print("D)\n")
most_used = word_count[ordered_hashtag_list[0]]
for hashtag in ordered_hashtag_list:
    print(f"{hashtag:<30} ({word_count[hashtag]:>2})  {'+' * ((word_count[hashtag] * 18) // most_used)}")
