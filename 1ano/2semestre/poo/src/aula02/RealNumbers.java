package aula02;

import java.util.Scanner;

// Solução do exercício 10

public class RealNumbers {
    public static void main(String[] args) {
        Scanner sin = new Scanner(System.in);

        int readNumbers = 1;

        System.out.println("Introduza os diversos números.");
        double first = sin.nextDouble();
        double max = first;
        double min = first;
        double sum = first;

        double n;
        do {
            n = sin.nextDouble();
            if (n > max)
                max = n;
            if (n < min)
                min = n;
            sum += n;
            ++readNumbers;
        } while (n != first);

        System.out.printf("Valor máximo: %f\nValor mínimo: %f\nMédia: %f\nTotal: %f\n", max, min, (float) sum / readNumbers, sum);

        sin.close();
    }
}