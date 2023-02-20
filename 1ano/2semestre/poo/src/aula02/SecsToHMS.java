package aula02;

// Código da package utils disponível em
// https://github.com/TiagoRG/uaveiro-leci/tree/master/1ano/2semestre/poo/src/utils
import utils.UserInput;

import java.util.Scanner;

// Solução do exercício 6

public class SecsToHMS {
    public static void main(String[] args){
        Scanner sin = new Scanner(System.in);

        System.out.println("Introduza os segundos totais: ");
        int totalSecs = (int) UserInput.getPositiveNumber(sin);
        int secs = totalSecs % 60;
        int mins = Math.round((float) (totalSecs / 60));
        int hours = Math.round((float) (mins / 60));
        mins = mins % 60;
        System.out.printf("%d segundos no formato hh:mm:ss : %d:%d:%d\n", totalSecs, hours, mins, secs);

        sin.close();
    }
}