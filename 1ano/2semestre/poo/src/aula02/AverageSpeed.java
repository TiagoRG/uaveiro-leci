package aula02;

import utils.UserInput;

import java.util.Scanner;

// Solução do exercício 5

public class AverageSpeed {
    public static void main(String[] args) {
        Scanner sin = new Scanner(System.in);
        System.out.println("v1? ");
        double v1 = UserInput.getPositiveNumber(sin);
        System.out.println("d1? ");
        double d1 = UserInput.getPositiveNumber(sin);
        System.out.println("v2? ");
        double v2 = UserInput.getPositiveNumber(sin);
        System.out.println("d2? ");
        double d2 = UserInput.getPositiveNumber(sin);

        double vm = (d1 + d2) / ((d1 / v1) + (d2 / v2));
        System.out.printf("Velocidade final da viagem: %.2fkm/h\n", vm);

        sin.close();
    }
}
