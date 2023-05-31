package aula02;

// Código da package utils disponível em
// https://github.com/TiagoRG/uaveiro-leci/tree/master/1ano/2semestre/poo/src/utils

import utils.UserInput;

import java.util.Scanner;

// Solução do exercício 1

public class KmToMiles {
    public static void main(String[] args) {
        System.out.print("Km? ");
        Scanner sin = new Scanner(System.in);
        double km = UserInput.getPositiveNumber(sin);
        double miles = km / 1.609;
        System.out.printf("%.3fkm = %.3f miles\n", km, miles);

        sin.close();
    }
}