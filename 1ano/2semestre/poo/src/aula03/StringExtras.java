package aula03;

import utils.StringMethods;

import java.util.Scanner;

public class StringExtras {
    public static void main(String[] args) {
        Scanner sin = new Scanner(System.in);

        String str = sin.nextLine();

        System.out.println("Frase convertida para minúsculas: " + str.toLowerCase());
        System.out.println("Último caracter da frase: " + str.substring(str.length() - 1));
        System.out.println("Os 3 primeiros caracteres: " + str.substring(0, 3));
        System.out.printf("Número de digitos na frase: %d\n", StringMethods.countDigits(str));
        System.out.printf("Número de espaços na frase: %d\n", StringMethods.countSpaces(str));
        System.out.printf("A frase contém apenas letras minúsculas: %b\n", StringMethods.isAllLower(str));
        System.out.println("Frase sem espaços duplicados: " + StringMethods.removeDuplicatedSpaces(str));
        System.out.println("A string é um palindromo: " + StringMethods.isPalindrome(str));
        System.out.println("Acrónimo da string: " + StringMethods.getAcronym(str));

        sin.close();
    }
}
