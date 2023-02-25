package aula03;

import utils.UserInput;

import java.util.Scanner;

public class Investment {
    public static void main(String[] args) {
        Scanner sin = new Scanner(System.in);

        int investment;
        do {
            System.out.print("Introduza o investimento inicial (múltiplo de 1000): ");
            investment = sin.nextInt();
        } while (investment <= 0 || investment % 1000 != 0);

        System.out.print("Introduza a taxa a aplicar (entre 0% e 5%): ");
        double tax = UserInput.getNumberBetween(sin, 0, 5);

        for (int i = 1; i <= 12; i++) {
            investment *= 1+tax/100;
            System.out.printf("Investimento em %d %s: %d\n", i, i==1?"mês":"meses", investment);
        }

        sin.close();
    }
}
