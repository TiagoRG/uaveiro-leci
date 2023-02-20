package aula02;

import java.util.Scanner;

// Solução do exercício 10

public class RealNumbers {
    public static void main(String[] args){
        Scanner sin = new Scanner(System.in);

        int readNumbers = 1;

        System.out.println("Introduza os diversos números.");
        double first = sin.nextDouble();
        double max = first;
        double min = first;
        double sum = first;

        while (true) {
            double n = sin.nextDouble();
            if (n == first)
                break;
            if (n > max)
                max = n;
            if (n < min)
                min = n;
            sum += n;
            ++readNumbers;
        }

        System.out.printf("Valor máximo: %f\nValor mínimo: %f\nMédia: %f\nTotal: %f", max, min, (float) sum/readNumbers, sum);

        sin.close();
    }
}