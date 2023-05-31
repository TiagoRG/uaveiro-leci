package aula09.ex3;

import java.util.Scanner;

public class PlaneTester {
    public static void main(String[] args) {
        PlaneManager planeManager = new PlaneManager();
        Scanner scanner = new Scanner(System.in);
        int choice;

        do {
            System.out.println("\nPlane Fleet Menu:");
            System.out.println("1. Add a plane to the fleet");
            System.out.println("2. Remove a plane from the fleet");
            System.out.println("3. Search for a plane");
            System.out.println("4. Print summary of all planes in the fleet");
            System.out.println("5. Print list of all commercial planes in the fleet");
            System.out.println("6. Print list of all military planes in the fleet");
            System.out.println("7. Print the fastest plane in the fleet");
            System.out.println("0. Exit");

            System.out.print("Enter your choice: ");
            choice = Integer.parseInt(scanner.nextLine());

            switch (choice) {
                case 1 -> addPlane(planeManager, scanner);
                case 2 -> removePlane(planeManager, scanner);
                case 3 -> searchPlane(planeManager, scanner);
                case 4 -> printAllPlanes(planeManager);
                case 5 -> printCommercialPlanes(planeManager);
                case 6 -> printMilitaryPlanes(planeManager);
                case 7 -> printFastestPlane(planeManager);
                case 0 -> System.out.println("Exiting program...");
                default -> System.out.println("Invalid choice. Please try again.");
            }
        } while (choice != 0);

        scanner.close();
    }

    private static void addPlane(PlaneManager planeManager, Scanner scanner) {
        System.out.print("Enter the plane's ID: ");
        String id = scanner.nextLine();
        System.out.print("Enter the plane's manufacturer: ");
        String manufacturer = scanner.nextLine();
        System.out.print("Enter the plane's model: ");
        String model = scanner.nextLine();
        System.out.print("Enter the plane's year of manufacture: ");
        int year = Integer.parseInt(scanner.nextLine());
        System.out.print("Enter the plane's passenger count: ");
        int passengerCount = Integer.parseInt(scanner.nextLine());
        System.out.print("Enter the plane's maximum speed: ");
        int maxSpeed = Integer.parseInt(scanner.nextLine());
        System.out.print("Enter the plane's type (commercial/military): ");
        String type = scanner.nextLine();
        if (type.equals("commercial")) {
            System.out.print("Enter the plane's crew members count: ");
            int crewMembersCount = Integer.parseInt(scanner.nextLine());
            planeManager.addPlane(new CommercialPlane(id, manufacturer, model, year, passengerCount, maxSpeed, crewMembersCount));
        } else if (type.equals("military")) {
            System.out.print("Enter the plane's missile count: ");
            int missileCount = Integer.parseInt(scanner.nextLine());
            planeManager.addPlane(new MilitaryPlane(id, manufacturer, model, year, passengerCount, maxSpeed, missileCount));
        }
    }

    private static void removePlane(PlaneManager planeManager, Scanner scanner) {
        System.out.print("Enter the plane's ID: ");
        String id = scanner.nextLine();
        if (planeManager.searchPlane(id) == null) {
            System.out.println("Plane not found.");
            return;
        }
        planeManager.removePlane(id);
    }

    private static void searchPlane(PlaneManager planeManager, Scanner scanner) {
        System.out.print("Enter the plane's ID: ");
        String id = scanner.nextLine();
        Plane plane = planeManager.searchPlane(id);
        if (plane == null) {
            System.out.println("Plane not found.");
            return;
        }
        System.out.println(plane);
    }

    private static void printAllPlanes(PlaneManager planeManager) {
        planeManager.printAllPlanes();
    }

    private static void printCommercialPlanes(PlaneManager planeManager) {
        planeManager.printAllPlanes("commercial");
    }

    private static void printMilitaryPlanes(PlaneManager planeManager) {
        planeManager.printAllPlanes("military");
    }

    private static void printFastestPlane(PlaneManager planeManager) {
        System.out.print(planeManager.getFastestPlane());
    }
}
