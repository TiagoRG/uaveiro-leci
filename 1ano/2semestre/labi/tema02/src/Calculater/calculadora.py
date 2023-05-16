import pytest
import aritmetica



def main():
    print("Welcome to the Calculator!")
    
    while True:
        print("Please choose an operation:")
        print("1. Addition (+)")
        print("2. Subtraction (-)")
        print("3. Multiplication (*)")
        print("4. Division (/)")
        print("5. Resto (%)")
        print("6. Square Root (sqrt)")
        print("7. Exit")

        choice = input("Enter your choice (1-6): ")

        if choice == '7':
            print("Goodbye!")
            break
        elif choice == '1':
            while True:
                try:
                    num1 = float(input("Enter the first number: "))
                    num2 = float(input("Enter the second number: "))
                except ValueError as e:
                    print("Invalid input. Please enter a number.")
                    print("Error: ", e.__doc__)
                    continue
                
                result = aritmetica.soma(num1, num2)

                print(f"{num1} + {num2} = {result}")

                exit = input('To continue operation press ( y ) ?')

                if exit.upper() != 'Y':
                    break
        elif choice == '2':
            while True:
                try:
                    num1 = float(input("Enter the first number: "))
                    num2 = float(input("Enter the second number: "))
                except ValueError as e:
                    print("Invalid input. Please enter a number.")
                    print("Error: ", e.__doc__)
                    continue
                
                result = aritmetica.subtracao(num1, num2)

                print(f"{num1} - {num2} = {result}")

                exit = input('To continue operation press ( y ) ?')

                if exit.upper() != 'Y':
                    break
        elif choice == '3':
            while True:
                try:
                    num1 = float(input("Enter the first number: "))
                    num2 = float(input("Enter the second number: "))
                except ValueError as e:
                    print("Invalid input. Please enter a number.")
                    print("Error: ", e.__doc__)
                    continue
                
                result = aritmetica.multiplicacao(num1, num2)

                print(f"{num1} * {num2} = {result}")

                exit = input('To continue operation press ( y ) ?')

                if exit.upper() != 'Y':
                    break
        elif choice == '4':
            while True:
                try:
                    num1 = float(input("Enter the first number: "))
                    num2 = float(input("Enter the second number: "))
                except ValueError as e:
                    print("Invalid input. Please enter a number.")
                    print("Error: ", e.__doc__)
                    continue
                
                result = aritmetica.divisao(num1, num2)

                print(f"{num1} / {num2} = {result}")

                exit = input('To continue operation press ( y ) ?')

                if exit.upper() != 'Y':
                    break
        elif choice == '5' :
            while True:
                try:
                    num1 = float(input("Enter the first number: "))
                    num2 = float(input("Enter the second number: "))
                except ValueError as e:
                    print("Invalid input. Please enter a number.")
                    print("Error: ", e.__doc__)
                    continue
                
                result = aritmetica.resto_divisao_inteira(num1, num2)

                print(f"{num1} % {num2} = {result}")

                exit = input('To continue operation press ( y ) ?')

                if exit.upper() != 'Y':
                    break
        elif choice == '6':
            while True:
                try:
                    num1 = float(input("Enter the first number: "))
                except ValueError as e:
                    print("Invalid input. Please enter a number.")
                    print("Error: ", e.__doc__)
                    continue
                
                result = aritmetica.raiz_quadrada(num1)

                print(f"sqrt({num1}) = {result}")

                exit = input('To continue operation press ( y ) ?')

                if exit.upper() != 'Y':
                    break
        else:
            print("Invalid input. Please enter a number between 1 and 6.")


if __name__ == "__main__":
    pytest.main(['-x', 'test_unitarios.py'])
    pytest.main(['-x', 'test_funcionais.py'])
    main()