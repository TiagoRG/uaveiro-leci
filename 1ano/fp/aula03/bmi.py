""" Exercicio 03.
O programa bmi.py serve para calcular o índice de massa corporal, mas está incompleto. O
programa inclui três funçoes. Analise o seu funcionamento.

a.  Complete a definiçao da funçao bodyMassIndex para calcular o indice pela razao
    bmi = weight / height**2. Complete os argumentos na invocacao da funçao, dentro da
    funçao principal. Teste o programa.

b.  Complete a funçao bmiCategory para devolver uma string com a categoria correspondente
    ao indice de massa corporal dado. Acrescente uma chamada a esta funçao na funçao
    principal, para obter o nome da categoria. Volte a testar
"""

# This function computes the body mass index (BMI),
# given the height (in meter) and weight (in kg) of a person.
def bodyMassIndex(height, weight):
    # Complete the function definition...
    bmi = weight / height**2
    return bmi


# This function returns the BMI category acording to this table:
# BMI:        <18.5         [18.5, 25[      [25, 30[      30 or greater 
# Category:   Underweight   Normal weight   Overweight    Obesity 
def bmiCategory(bmi):
    assert bmi>0
    # Complete the function definition...
    if bmi < 18.5:
        return 'Underweight'
    elif bmi < 25:
        return 'Normal weight'
    elif bmi < 30:
        return 'Overweight'
    else:
        return 'Obesity'


# This is the main function
def main():
    print("Índice de Massa Corporal")
    
    altura = float(input("Altura (m)? "))
    if altura < 0:
        print("ERRO: altura inválida!")
        exit(1)

    peso = float(input("Peso (kg)? "))
    if peso < 0:
        print("ERRO: peso inválido!")
        exit(1)

    # Complete the function calls...
    imc = bodyMassIndex(altura, peso)
    cat = bmiCategory(imc)

    print("BMI: {:.2f} kg/m2".format(imc))
    print("BMI category:", cat)


# Program starts executing here
main()

