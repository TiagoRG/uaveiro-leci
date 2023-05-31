package aula02;

// Código da package utils disponível em
// https://github.com/TiagoRG/uaveiro-leci/tree/master/1ano/2semestre/poo/src/utils

import utils.UserInput;

import java.util.Scanner;

// Solução do exercício 4

public class Investment {
    public static void main(String[] args) {
        Scanner sin = new Scanner(System.in);
        System.out.print("Saldo inicial (Euros)? ");
        double initialWallet = UserInput.getPositiveNumber(sin);
        System.out.print("Taxa de juro mensal (%)? ");
        double tax = sin.nextDouble();
        double finalWallet = initialWallet * Math.pow(1 + tax / 100, 3);
        System.out.printf("O saldo final será de %.2f euros\n", finalWallet);

        sin.close();
    }
}
