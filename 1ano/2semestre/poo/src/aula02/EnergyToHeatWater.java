package aula02;

// Código da package utils disponível em
// https://github.com/TiagoRG/uaveiro-leci/tree/master/1ano/2semestre/poo/src/utils

import utils.UserInput;

import java.util.Scanner;

// Solução do exercício 3

public class EnergyToHeatWater {
    public static void main(String[] args) {
        Scanner sin = new Scanner(System.in);
        System.out.print("Kg de água? ");
        double kgOfWater = UserInput.getPositiveNumber(sin);
        System.out.print("Temperatura inicial da água (ºC)? ");
        double initialTemperature = sin.nextDouble();
        System.out.print("Temperatura final da água (ºC)? ");
        double finalTemperature = sin.nextDouble();
        double energy = kgOfWater * (finalTemperature - initialTemperature) * 4184;
        System.out.printf("Para aquecer %.3fkg de água de %.2fºC para %.2fºC, serão necessários %.3fJ de energia.\n", kgOfWater, initialTemperature, finalTemperature, energy);

        sin.close();
    }
}
