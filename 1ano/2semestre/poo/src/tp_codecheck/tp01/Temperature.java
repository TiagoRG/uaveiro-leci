package tp_codecheck.tp01;

// Solução do exercício 1

/*
This is a short Java program to convert
a temperature from Celsius to Fahrenheit.
*/

// You may want to import stuff here...

import java.util.Scanner;

public class Temperature {
   // Create a Scanner to parse standard input:
   private static Scanner sc = new Scanner(System.in);

   public static void main(String[] args) {
      // Put your code here
      System.out.print("Celsius? ");
      double celcius = sc.nextDouble();
      double fahrenheit = 1.8*celcius+32;
      System.out.printf("%f C = %f F\n", celcius, fahrenheit);

      System.out.println("THE END");
   }
}

// JMR 2023