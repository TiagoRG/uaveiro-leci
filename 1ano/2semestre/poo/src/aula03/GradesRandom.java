package aula03;


// Solução do exercício 4 com notas aleatórias

import java.util.Random;
import java.util.Scanner;

public class GradesRandom {
    private static final Scanner sin = new Scanner(System.in);
    private static final Random rand = new Random();

    public static void main(String[] args) {
        System.out.print("Quantos alunos tem a turma? ");
        int studentCount = sin.nextInt();

        System.out.println("NotaT  NotaP  Pauta");
        for (int i = 0; i < studentCount; i++) {
            double notaT = rand.nextDouble(0, 20);
            double notaP = rand.nextDouble(0, 20);
            System.out.printf("%5.1f  %5.1f  %5d\n", notaT, notaP, (notaT < 7 || notaP < 7) ? 66 : (int) Math.round(0.4 * notaT + 0.6 * notaP));
        }
    }
}
