package aula04;

import java.util.Arrays;
import java.util.Scanner;

public class CarDemo {

    static Scanner sc = new Scanner(System.in);

    static int registerCars(Car[] cars) {
        // TODO: pede dados dos carros ao utilizador e acrescenta ao vetor
        // registo de carros termina quando o utilizador inserir uma linha vazia 
        // devolve número de carros registados
        for (int i = 0; i < 10; i++) {
            boolean validData = false;
            while (!validData) {
                System.out.print("Insira dados do carro (marca modelo ano quilómetros): ");
                String input = sc.nextLine();
                if (input.isEmpty()) return i;
                String[] parts = input.split(" ");
                validData = validateData(parts);
                if (!validData) {
                    System.out.println("Dados mal formatados. Tente novamente.");
                } else {
                    String model = String.join(" ", Arrays.stream(parts, 1, parts.length - 2).toArray(String[]::new));
                    cars[i] = new Car(parts[0], model, Integer.parseInt(parts[parts.length - 2]), Integer.parseInt(parts[parts.length - 1]));
                }
            }
        }
        return 10;
    }

    static boolean validateData(String[] parts) {
        if (parts.length < 4) return false;
        try {
            Integer.parseInt(parts[parts.length - 1]);
            if (String.format("%d", Integer.parseInt(parts[parts.length - 2])).length() != 4) return false;
        } catch (NumberFormatException e) {
            return false;
        }
        return true;
    }

    static void registerTrips(Car[] cars, int numCars) {
        // TODO: pede dados das viagens ao utilizador e atualiza informação do carro
        // registo de viagens termina quando o utilizador inserir uma linha vazia
        String input;
        while (true) {
            System.out.print("Registe uma viagem no formato \"carro:distância\": ");
            if ((input = sc.nextLine()).isEmpty()) break;
            String[] parts = input.split(":");
            if (parts.length != 2) {
                System.out.println("Dados mal formatados. Tente novamente.");
            } else {
                try {
                    int car = Integer.parseInt(parts[0]);
                    int distance = Integer.parseInt(parts[1]);
                    if (car < 0 || car >= numCars || distance <= 0) {
                        System.out.println("Dados mal formatados. Tente novamente.");
                    } else {
                        cars[car].drive(distance);
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Dados mal formatados. Tente novamente.");
                }
            }
        }
    }


    static void listCars(Car[] cars) {
        System.out.println("\nCarros registados: ");
        // TODO: lista todos os carros registados
        // Exemplo de resultado
        // Carros registados: 
        // Toyota Camry, 2010, kms: 234346
        // Renault Megane Sport Tourer, 2015, kms: 32536
        for (Car car : cars) {
            if (car != null) {
                System.out.println(car);
            }
        }

        System.out.println("\n");
    }

    public static void main(String[] args) {

        Car[] cars = new Car[10];

        int numCars = registerCars(cars);

        if (numCars > 0) {
            listCars(cars);
            registerTrips(cars, numCars);
            listCars(cars);
        }

        sc.close();

    }
}