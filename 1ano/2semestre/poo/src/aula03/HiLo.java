package aula03;

import utils.UserInput;

import java.util.Random;
import java.util.Scanner;

// Solução do exercício 3

public class HiLo {
    private static final Scanner sin = new Scanner(System.in);
    private static final Random rand = new Random();

    public static void main(String[] args) {
        String toContinue;
        do {
            game();
            System.out.print("Pretende continuar? Prima (S)im ");
            toContinue = sin.next();
        } while (toContinue.equals("S") || toContinue.equals("Sim"));
    }

    private static void game() {
        int secret = rand.nextInt(1, 100);
        int i = 1;
        int n;
        while (true) {
            System.out.printf("Tentativa %d: ", i);
            n = (int) UserInput.getNumberBetween(sin, 1, 100);
            if (n > secret)
                System.out.println("Tentativa demasiado alta");
            else if (n < secret)
                System.out.println("Tentativa demasiado baixa");
            else
                break;
            i++;
        }
        System.out.printf("Acertou, o número era %d, foram precisas %d tentativas.\n", secret, i);
    }
}
