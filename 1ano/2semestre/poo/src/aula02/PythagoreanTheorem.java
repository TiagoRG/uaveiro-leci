package aula02;

import utils.MathTools;
import utils.UserInput;

import java.util.Scanner;

// Solução do exercício 8

public class PythagoreanTheorem {
    public static void main(String[] args){
        Scanner sin = new Scanner(System.in);

        System.out.println("Cateto A:");
        double a = UserInput.getPositiveNumber(sin);
        System.out.println("Cateto B:");
        double b = UserInput.getPositiveNumber(sin);

        double c = Math.sqrt(Math.pow(a, 2) + Math.pow(b, 2));

        double cossin = a / c;
        double angRad = Math.acos(cossin);
        double angDeg = angRad * 180 / Math.PI;

        System.out.printf("O comprimento da hipotenusa é %f e o valor do angulo entre o cateto A e a hipotenusa é %f°", MathTools.round(c, 2), MathTools.round(angDeg, 2));
    }
}