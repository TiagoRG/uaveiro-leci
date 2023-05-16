"""
O código abaixo lida com comboios de mercadorias.
Cada comboio é representado por uma lista de vagões e cada vagão é uma lista com o tipo e a quantidade de mercadoria que transporta.

Por exemplo,
	t = [['coal', 30], ['rice', 50], ['iron', 5], ['rice', 42], ['coal', 45]]
representa um comboio com 5 vagões: o primeiro vagão tem 30 toneladas de carvão, o segundo tem 50 toneladas de arroz, etc.

Complete a função unload(t, m, q), que deve descarregar do comboio t uma quantidade q de mercadoria de tipo m.
Para isso, deve percorrer os vagões um a um, a partir do último, e descarregar total ou parcialmente os que tiverem a mercadoria pretendida até perfazer a quantidade pedida.
Os vagões totalmente descarregados devem ser retirados do comboio, mas os restantes têm de ficar no comboio pela ordem original.
Se conseguir descarregar toda a quantidade pedida, a função deve devolver zero.
Se não, deve devolver a quantidade que não conseguiu descarregar.

"""


# Se w=['coal', 45], então w[0]='coal' e w[1]=45.

def unload(t, m, q):
    for v in t[::-1]:
        if v[0] != m:
            continue
        if v[1] <= q:
            q -= v[1]
            t.remove(v)
        else:
            v[1] -= q
            q = 0
    return q


def main():
    t = eval(input())

    print("t: ", t)
    q = unload(t, "rice", 40)
    print("unload(t, 'rice', 40) ->", q)

    print("t: ", t)
    q = unload(t, "coal", 50)
    print("unload(t, 'coal', 50) ->", q)

    print("t: ", t)
    q = unload(t, "iron", 20)
    print("unload(t, 'iron', 20) ->", q)


if __name__ == "__main__":
    main()
