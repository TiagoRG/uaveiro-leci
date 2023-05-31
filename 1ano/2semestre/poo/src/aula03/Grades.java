package aula03;

import utils.UserInput;

import java.util.Scanner;

// Solução do exercício 4 com o utilizador a introduzir as notas individualmente

public class Grades {
    private static final Scanner sin = new Scanner(System.in);

    public static void main(String[] args) {
        System.out.print("Quantos alunos tem a turma? ");
        int studentCount = sin.nextInt();
        Student[] students = new Student[studentCount];

        for (int i = 0; i < studentCount; i++) {
            System.out.printf("Nota teórica do aluno %d: ", i + 1);
            double notaT = UserInput.getNumberBetween(sin, 0, 20);
            System.out.printf("Nota prática do aluno %d: ", i + 1);
            double notaP = UserInput.getNumberBetween(sin, 0, 20);
            students[i] = new Student(notaT, notaP);
        }

        printGrades(students);
        System.out.println();
    }

    private static void printGrades(Student[] students) {
        System.out.println("NotaT  NotaP  Pauta");
        for (Student student : students) {
            System.out.printf("%5.1f  %5.1f  %5d\n", student.notaT, student.notaP, student.notaFinal);
        }
    }

    private static class Student {
        public double notaT;
        public double notaP;
        public int notaFinal;

        public Student(double notaT, double notaP) {
            this.notaT = notaT;
            this.notaP = notaP;
            this.notaFinal = (notaT < 7 || notaP < 7) ? 66 : (int) Math.round(0.4 * notaT + 0.6 * notaP);
        }
    }
}
