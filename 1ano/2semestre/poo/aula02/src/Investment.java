import java.util.Scanner;

// Solução do exercício 4

public class Investment {
    public static void main(String[] args) {
        Scanner sin = new Scanner(System.in);
        System.out.print("Saldo inicial (Euros)? ");
        double initialWallet = sin.nextDouble();
        System.out.print("Taxa de juro mensal (%)? ");
        double tax = sin.nextDouble();
        double finalWallet = initialWallet * Math.pow(1 + tax/100, 3);
        System.out.printf("O saldo final será de %f euros", finalWallet);
    }
}