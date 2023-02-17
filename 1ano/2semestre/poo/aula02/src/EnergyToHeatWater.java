import java.util.Scanner;

// Solução do exercício 3

public class EnergyToHeatWater {
    public static void main(String[] args) {
        Scanner sin = new Scanner(System.in);
        System.out.print("Kg de água? ");
        double kgOfWater = sin.nextDouble();
        System.out.print("Temperatura inicial da água (ºC)? ");
        double initialTemperature = sin.nextDouble();
        System.out.print("Temperatura final da água (ºC)? ");
        double finalTemperature = sin.nextDouble();
        double energy = kgOfWater * (finalTemperature - initialTemperature) * 4184;
        System.out.printf("Para aquecer %fkg de água de %fºC para %fºC, serão necessários %fJ de energia.", kgOfWater, initialTemperature, finalTemperature, energy);
    }
}
