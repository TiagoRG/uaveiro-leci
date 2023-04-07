package aula08.ex1;

import java.util.Objects;

public class Taxi extends Car {
    private final int licenseNumber;

    public Taxi(Car car, int licenseNumber) {
        super(car);
        this.licenseNumber = licenseNumber;
    }

    public Taxi(Taxi taxi) {
        this(taxi.getCar(), taxi.getLicenseNumber());
    }

    public Car getCar() {
        return new Car(this.getPlate(), this.getBrand(), this.getModel(), this.getPotency(), this.getBoardNumber(), this.getTrunkSize());
    }

    public int getLicenseNumber() {
        return this.licenseNumber;
    }

    @Override
    public String toString() {
        return "Taxi {" +
                "\n\tlicenseNumber=" + this.licenseNumber +
                ",\n\tplate='" + this.getPlate() + '\'' +
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
        Taxi taxi = (Taxi) o;
        return this.getLicenseNumber() == taxi.getLicenseNumber();
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), getLicenseNumber());
    }
}
