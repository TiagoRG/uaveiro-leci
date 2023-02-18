package aula02;

import java.util.Scanner;

// Solução do exercício 7

public class DistanceBetweenPoints {
    public static void main(String[] args){
        Scanner sin = new Scanner(System.in);

        System.out.print("Coordenadas do ponto 1 (separadas por ','): ");
        String[] p1 = sin.next().split(",");
        System.out.print("Coordenadas do ponto 2 (separadas por ','): ");
        String[] p2 = sin.next().split(",");

        double distance = Math.sqrt(
                Math.pow(Double.parseDouble(p1[0]) - Double.parseDouble(p2[0]), 2) +
                Math.pow(Double.parseDouble(p1[1]) - Double.parseDouble(p2[1]), 2));

        System.out.printf("A distância entre os dois pontos é %f", distance);
    }
}