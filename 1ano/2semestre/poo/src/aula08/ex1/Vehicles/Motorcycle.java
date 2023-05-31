package aula08.ex1.Vehicles;

import aula08.ex1.Interfaces.IFuelVehicle;

import java.util.Objects;

public class Motorcycle extends Vehicle implements IFuelVehicle {
    private final MotorcycleType type;

    private int fuelLevel;

    public Motorcycle(String plate, String brand, String model, int potency, MotorcycleType type) {
        super(plate, brand, model, potency);
        this.type = type;
        this.fuelLevel = 0;
    }

    public Motorcycle(Motorcycle motorcycle) {
        this(motorcycle.getPlate(), motorcycle.getBrand(), motorcycle.getModel(), motorcycle.getPotency(), motorcycle.getType());
    }

    public MotorcycleType getType() {
        return this.type;
    }

    @Override
    public String toString() {
        return "Motorcycle {" +
                "\n\tplate='" + this.getPlate() + '\'' +
                ",\n\tbrand='" + this.getBrand() + '\'' +
                ",\n\tmodel='" + this.getModel() + '\'' +
                ",\n\tpotency=" + this.getPotency() +
                ",\n\ttype=" + this.getType().toString() +
                ",\n\tlastTripKm=" + this.lastTrip() +
                ",\n\tkm=" + this.totalDistance() +
                ",\n\tfuelLevel=" + this.fuelLevel() +
                "\n}";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Motorcycle that = (Motorcycle) o;
        return this.getType() == that.getType();
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), this.getType());
    }

    @Override
    public int fuelLevel() {
        return this.fuelLevel;
    }

    @Override
    public void fillTank(int level) {
        this.fuelLevel = level;
    }

    public enum MotorcycleType {
        SPORT, TOURING;

        public static MotorcycleType fromString(String s) {
            return switch (s) {
                case "SPORT", "Sport", "sport" -> SPORT;
                case "TOURING", "Touring", "touring" -> TOURING;
                default -> throw new IllegalArgumentException("Invalid MotorcycleType: " + s);
            };
        }

        public String toString() {
            return switch (this) {
                case SPORT -> "Sport";
                case TOURING -> "Touring";
            };
        }
    }
}