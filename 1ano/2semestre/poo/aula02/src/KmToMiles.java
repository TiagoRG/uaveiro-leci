import java.util.Scanner;

// Solução do exercício 1

public class KmToMiles {
    public static void main(String[] args) {
        System.out.print("Km? ");
        Scanner sin = new Scanner(System.in);
        double km = sin.nextDouble();
        double miles = km / 1.609;
        System.out.printf("%fkm = %f miles", km, miles);
    }
}