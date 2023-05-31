package aula02;

import java.util.Scanner;

// Solução do exercício 9

public class Countdown {
    public static void main(String[] args) {
        Scanner sin = new Scanner(System.in);

        System.out.print("N? ");
        int n = sin.nextInt();
        for (int i = n; i >= 0; i--) {
            // If the statement before '?' is true then the expression before the ':' is used, else the expression after the ':' is used.
            // In python: i + "\n" if i%10 == 0 else i + ","
            System.out.print(i % 10 == 0 ? i + "\n" : i + ",");
        }

        sin.close();
    }
}