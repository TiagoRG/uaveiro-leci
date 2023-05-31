package aula02;

import java.util.Scanner;

// Solução do exercício 2

public class CelciusToFahrenheit {
    public static void main(String[] args) {
        System.out.print("ºC? ");
        Scanner sin = new Scanner(System.in);
        double celcius = sin.nextDouble();
        double fahrenheit = 1.8 * celcius + 32;
        System.out.printf("%.2fºC = %.2fºF\n", celcius, fahrenheit);

        sin.close();
    }
}
