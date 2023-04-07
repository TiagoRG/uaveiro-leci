package aula08.ex1;

import java.util.Objects;

public class Car extends Vehicle {
    private final int boardNumber;
    private final int trunkSize;

    public Car(String plate, String brand, String model, int potency, int boardNumber, int trunkSize) {
        super(plate, brand, model, potency);
        this.boardNumber = boardNumber;
        this.trunkSize = trunkSize;
    }

    public Car(Car car) {
        this(car.getPlate(), car.getBrand(), car.getModel(), car.getPotency(), car.getBoardNumber(), car.getTrunkSize());
    }

    public int getBoardNumber() {
        return this.boardNumber;
    }

    public int getTrunkSize() {
        return this.trunkSize;
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
                "\n}";
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Car car = (Car) o;
        return this.getBoardNumber() == car.getBoardNumber() && this.getTrunkSize() == car.getTrunkSize();
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), this.getBoardNumber(), this.getTrunkSize());
    }
}
