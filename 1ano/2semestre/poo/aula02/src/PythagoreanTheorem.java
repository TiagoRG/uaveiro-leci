import java.util.Scanner;

// Solução do exercício 8

public class PythagoreanTheorem {
    public static void main(String[] args){
        Scanner sin = new Scanner(System.in);

        System.out.println("Cateto A:");
        double a;
        do {
            a = sin.nextDouble();
        } while (a <= 0);
        System.out.println("Cateto B:");
        double b;
        do {
            b = sin.nextDouble();
        } while (b <= 0);

        double c = Math.sqrt(Math.pow(a, 2) + Math.pow(b, 2));

        double cossin = a / c;
        double angRad = Math.acos(cossin);
        double angDeg = angRad * 180 / Math.PI;

        System.out.printf("O comprimento da hipotenusa é %f e o valor do angulo entre o cateto A e a hipotenusa é %f°", (float) (Math.round(c * 100) / 100), (float) (Math.round(angDeg * 100) / 100));
    }
}