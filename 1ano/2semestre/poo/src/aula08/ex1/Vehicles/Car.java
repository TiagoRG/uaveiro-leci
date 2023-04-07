package aula08.ex1.Vehicles;

import aula08.ex1.Enums.EngineType;
import aula08.ex1.Interfaces.IElectricVehicle;
import aula08.ex1.Interfaces.IFuelVehicle;

import java.util.Objects;

public class Car extends Vehicle implements IElectricVehicle, IFuelVehicle {
    private final int boardNumber;
    private final int trunkSize;
    private final EngineType engineType;

    private int fuelLevel;
    private int battery;

    public Car(String plate, String brand, String model, int potency, int boardNumber, int trunkSize, EngineType engineType) {
        super(plate, brand, model, potency);
        if (trunkSize <= 0)
            throw new IllegalArgumentException("Trunk size must be positive.");
        this.boardNumber = boardNumber;
        this.trunkSize = trunkSize;
        this.engineType = engineType;
        this.fuelLevel = 0;
        this.battery = 0;
    }

    public Car(Car car) {
        this(car.getPlate(), car.getBrand(), car.getModel(), car.getPotency(), car.getBoardNumber(), car.getTrunkSize(), car.getEngineType());
    }

    public int getBoardNumber() {
        return this.boardNumber;
    }

    public int getTrunkSize() {
        return this.trunkSize;
    }

    public EngineType getEngineType() {
        return this.engineType;
    }

    @Override
    public String toString() {
        return "Car {" +
                "\n\tplate='" + this.getPlate() + '\'' +
                ",\n\tbrand='" + this.getBrand() + '\'' +
                ",\n\tmodel='" + this.getModel() + '\'' +
                ",\n\tpotency=" + this.getPotency() +
                ",\n\tboardNumber=" + this.getBoardNumber() +
                ",\n\ttrunkSize=" + this.getTrunkSize() +
                ",\n\tlastTripKm=" + this.lastTrip() +
                ",\n\tkm=" + this.totalDistance() +
                String.format(",\n\t%s=%d", this.engineType == EngineType.FUEL ? "fuelLevel" : "battery", this.engineType == EngineType.FUEL ? this.fuelLevel : this.battery) +
                "\n}";
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Car car = (Car) o;
        return this.getBoardNumber() == car.getBoardNumber() && this.getTrunkSize() == car.getTrunkSize() && this.getEngineType().equals(car.getEngineType());
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), this.getBoardNumber(), this.getTrunkSize(), this.getEngineType());
    }

    @Override
    public int currentBatteryLvl() {
        return this.battery;
    }

    @Override
    public void charge(int percentage) {
        if (this.engineType == EngineType.FUEL)
            return;
        this.battery = percentage;
    }

    @Override
    public int fuelLevel() {
        return this.fuelLevel;
    }

    @Override
    public void fillTank(int level) {
        if (this.engineType == EngineType.ELECTRIC)
            return;
        this.fuelLevel = level;
    }
}
