package aula02;

// Código da package utils disponível em
// https://github.com/TiagoRG/uaveiro-leci/tree/master/1ano/2semestre/poo/src/utils

import utils.UserInput;

import java.util.Scanner;

// Solução do exercício 8

public class PythagoreanTheorem {
    public static void main(String[] args) {
        Scanner sin = new Scanner(System.in);

        System.out.println("Cateto A:");
        double a = UserInput.getPositiveNumber(sin);
        System.out.println("Cateto B:");
        double b = UserInput.getPositiveNumber(sin);

        double c = Math.sqrt(Math.pow(a, 2) + Math.pow(b, 2));
        double angDeg = Math.acos(a / c) * 180 / Math.PI;

        System.out.printf("O comprimento da hipotenusa é %.2f e o valor do angulo entre o cateto A e a hipotenusa é %.2f°\n", c, angDeg);

        sin.close();
    }
}