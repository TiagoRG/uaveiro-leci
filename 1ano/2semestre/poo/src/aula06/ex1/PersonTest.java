package aula06.ex1;

import utils.DateYMD;

import java.util.Scanner;

public class PersonTest {
    public static void main(String[] args) {
        Scanner sin = new Scanner(System.in);

        Student al = new Student("Andreia Melo", 98556781, new DateYMD(18, 7, 1990), new DateYMD(1, 9, 2018));
        Professor p1 = new Professor("Jorge Almeida", 34672215, new DateYMD(13, 3, 1967), "Associado", "Informática");
        Bolser bls = new Bolser("Igor Santos", 89765431, new DateYMD(11, 5, 1985), p1, 900);
        bls.setMonthlyAmount(1050);
        System.out.println("Student:" + al.getName());
        System.out.println(al);
        System.out.println("Bolser:" + bls.getName() + ", NMec: " + bls.getNMec() + ", Bolsa:" + bls.getMonthlyAmount() + ", Orientador:" + bls.getSupervisor());
        System.out.println(bls);

        sin.close();
    }
}
