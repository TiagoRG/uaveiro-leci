package aula08.ex1;

import java.util.Objects;

public abstract class Vehicle implements IKmTravelled {
    private final String plate;
    private final String brand;
    private final String model;
    private final int potency;

    private int lastTripKm;
    private int km;

    protected Vehicle(String plate, String brand, String model, int potency) {
        this.plate = plate;
        this.brand = brand;
        this.model = model;
        this.potency = potency;
        this.lastTripKm = 0;
        this.km = 0;
    }

    protected String getPlate() {
        return this.plate;
    }

    protected String getBrand() {
        return this.brand;
    }

    protected String getModel() {
        return this.model;
    }

    protected int getPotency() {
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
