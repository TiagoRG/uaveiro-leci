package aula08.ex1;

import aula08.ex1.Enums.EngineType;
import aula08.ex1.Vehicles.*;

import java.util.Scanner;

public class VehicleComp {
    private final String name;
    private Vehicle[] vehicles;

    public VehicleComp(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }

    public void listVehicles() {
        System.out.println("List of vehicles in company " + this.name);
        if (this.vehicles == null) {
            System.out.println("You must add a vehicle first");
            return;
        }
        for (Vehicle v : this.vehicles)
            System.out.println(v);
    }

    public Vehicle getVehicleByPlate(String plate) {
        for (Vehicle v : this.vehicles)
            if (v.getPlate().equals(plate))
                return v;
        return null;
    }

    public void tripMenu(Scanner sin) {
        if (this.vehicles == null) {
            System.out.println("You must add a vehicle first");
            return;
        }
        this.listVehicles();
        System.out.print("Plate of the vehicle: ");
        String plate = sin.nextLine();
        System.out.print("Km to travel: ");
        int km = Integer.parseInt(sin.nextLine());
        Vehicle vehicle = this.getVehicleByPlate(plate);

        vehicle.trip(km);
    }

    public void printVehicleWithMostKm() {
        if (this.vehicles == null) {
            System.out.println("You must add a vehicle first");
            return;
        }
        Vehicle max = this.vehicles[0];
        for (Vehicle vehicle : this.vehicles)
            if (vehicle.totalDistance() > max.totalDistance())
                max = vehicle;
        System.out.println(max);
    }


    // Add Vehicle methods

    public void addVehicleMenu(Scanner sin) {
        System.out.print("Vehicle plate: ");
        String plate = sin.nextLine();
        System.out.print("Vehicle brand: ");
        String brand = sin.nextLine();
        System.out.print("Vehicle model: ");
        String model = sin.nextLine();
        System.out.print("Vehicle potency: ");
        int potency = Integer.parseInt(sin.nextLine());
        System.out.print("What vehicle are you adding?\n1 - Motorcycle\n2 - Car\n3 - Taxi\n4 - Bus\n5 - Truck\n>> ");
        int vehicleType = Integer.parseInt(sin.nextLine());
        switch (vehicleType) {
            case 1 -> {
                System.out.print("What's the motorcycle type? (SPORT/TOURING): ");
                Motorcycle.MotorcycleType motorcycleType = Motorcycle.MotorcycleType.fromString(sin.nextLine());
                addVehicle(new Motorcycle(plate, brand, model, potency, motorcycleType));
            }
            case 2, 3, 4, 5 -> {
                System.out.print("Vehicle's board number: ");
                int boardNumber = Integer.parseInt(sin.nextLine());
                switch (vehicleType) {
                    case 2, 3 -> {
                        System.out.print("Car's trunk size: ");
                        int trunkSize = Integer.parseInt(sin.nextLine());
                        System.out.print("What's the engine type? (FUEL/ELECTRIC): ");
                        EngineType engineType = EngineType.fromString(sin.nextLine());
                        Car car = new Car(plate, brand, model, potency, boardNumber, trunkSize, engineType);
                        if (vehicleType == 2)
                            addVehicle(car);
                        else {
                            System.out.print("Taxi's license number: ");
                            int licenseNumber = Integer.parseInt(sin.nextLine());
                            addVehicle(new Taxi(car, licenseNumber));
                        }
                    }
                    case 4, 5 -> {
                        System.out.print("Vehicle's weight: ");
                        int weight = Integer.parseInt(sin.nextLine());
                        if (vehicleType == 4) {
                            System.out.print("Bus passenger limit: ");
                            int maxPassengers = Integer.parseInt(sin.nextLine());
                            System.out.print("What's the engine type? (FUEL/ELECTRIC): ");
                            EngineType engineType = EngineType.fromString(sin.nextLine());
                            addVehicle(new Bus(plate, brand, model, potency, boardNumber, weight, maxPassengers, engineType));
                        } else {
                            System.out.print("Truck weight limit: ");
                            int maxWeight = Integer.parseInt(sin.nextLine());
                            addVehicle(new Truck(plate, brand, model, potency, boardNumber, weight, maxWeight));
                        }
                    }
                }
            }
            default -> throw new IllegalStateException("Unexpected value: " + vehicleType);
        }
    }

    private void addVehicle(Vehicle vehicle) {
        if (this.vehicles == null) {
            this.vehicles = new Vehicle[1];
            this.vehicles[0] = vehicle;
        } else {
            Vehicle[] newVehicles = new Vehicle[this.vehicles.length + 1];
            System.arraycopy(this.vehicles, 0, newVehicles, 0, this.vehicles.length);
            newVehicles[newVehicles.length - 1] = vehicle;
            this.vehicles = newVehicles;
        }
    }


    // Remove Vehicle methods

    public void removeVehicleMenu(Scanner sin) {
        this.listVehicles();
        System.out.print("Plate of the vehicle to remove: ");
        String plate = sin.nextLine();
        Vehicle vehicle = this.getVehicleByPlate(plate);
        removeVehicle(vehicle);
    }

    private void removeVehicle(Vehicle vehicle) {
        Vehicle[] newVehicles = new Vehicle[this.vehicles.length - 1];
        int index = 0;
        for (Vehicle v : this.vehicles)
            if (!v.getPlate().equals(vehicle.getPlate()))
                newVehicles[index++] = v;
        this.vehicles = newVehicles;
    }


    private int totalDistance() {
        int total = 0;
        for (Vehicle vehicle : this.vehicles)
            total += vehicle.totalDistance();
        return total;
    }


    @Override
    public String toString() {
        return String.format("Company %s%nNumber of vehicles: %d%nTotal distance: %d", this.name, this.vehicles.length, this.totalDistance());
    }
}
