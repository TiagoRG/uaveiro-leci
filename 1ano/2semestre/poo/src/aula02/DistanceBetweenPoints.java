package aula02;

// Código da package utils disponível em
// https://github.com/TiagoRG/uaveiro-leci/tree/master/1ano/2semestre/poo/src/utils

import utils.UserInput;

import java.util.Scanner;

// Solução do exercício 7

public class DistanceBetweenPoints {
    public static void main(String[] args) {
        Scanner sin = new Scanner(System.in);

        String[] p1 = UserInput.input(sin, "Coordenadas do ponto 1 (separadas por ','): ").split(",");
        String[] p2 = UserInput.input(sin, "Coordenadas do ponto 2 (separadas por ','): ").split(",");

        double distance = Math.sqrt(
                Math.pow(Double.parseDouble(p1[0]) - Double.parseDouble(p2[0]), 2) +
                        Math.pow(Double.parseDouble(p1[1]) - Double.parseDouble(p2[1]), 2));

        System.out.printf("A distância entre os dois pontos é %.3f\n", distance);

        sin.close();
    }
}