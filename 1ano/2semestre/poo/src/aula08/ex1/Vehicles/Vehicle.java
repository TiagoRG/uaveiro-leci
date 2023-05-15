package aula08.ex1.Vehicles;

import aula08.ex1.Interfaces.IKmTravelled;
import aula08.ex1.Main;
import aula08.ex1.VehicleComp;
import utils.Validations;

import java.util.Objects;

public abstract class Vehicle implements IKmTravelled {
    private final String plate;
    private final String brand;
    private final String model;
    private final int potency;

    private int lastTripKm;
    private int km;

    public Vehicle(String plate, String brand, String model, int potency) {
        if (!Validations.validateVehiclePlate(plate))
            throw new IllegalArgumentException("Invalid plate!");
        for (VehicleComp vehicleComp : Main.vehicleComps)
            if (vehicleComp.getVehicleByPlate(plate) != null)
                throw new IllegalArgumentException("Plate already exists!");
        if (brand == null || brand.isEmpty())
            throw new IllegalArgumentException("Brand must not be empty");
        if (model == null || model.isEmpty())
            throw new IllegalArgumentException("Model must not be empty");
        if (potency <= 0)
            throw new IllegalArgumentException("Potency must be positive");
        this.plate = plate;
        this.brand = brand;
        this.model = model;
        this.potency = potency;
        this.lastTripKm = 0;
        this.km = 0;
    }

    public String getPlate() {
        return this.plate;
    }

    public String getBrand() {
        return this.brand;
    }

    public String getModel() {
        return this.model;
    }

    public int getPotency() {
        return this.potency;
    }

    @Override
    public void trip(int km) {
        this.lastTripKm = km;
        this.km += km;
    }

    @Override
    public int lastTrip() {
        return lastTripKm;
    }

    @Override
    public int totalDistance() {
        return km;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Vehicle vehicle = (Vehicle) o;
        return this.getPotency() == vehicle.getPotency() && this.lastTripKm == vehicle.lastTripKm && this.km == vehicle.km && this.getPlate().equals(vehicle.getPlate()) && this.getBrand().equals(vehicle.getBrand()) && this.getModel().equals(vehicle.getModel());
    }

    @Override
    public int hashCode() {
        return Objects.hash(this.getPlate(), this.getBrand(), this.getModel(), this.getPotency(), this.lastTripKm, this.km);
    }
}
