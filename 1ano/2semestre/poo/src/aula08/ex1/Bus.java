package aula08.ex1;

import java.util.Objects;

public class Bus extends Vehicle {
    private final int boardNumber;
    private final int weight;
    private final int maxPassengers;

    public Bus(String plate, String brand, String model, int potency, int boardNumber, int weight, int maxPassengers) {
        super(plate, brand, model, potency);
        this.boardNumber = boardNumber;
        this.weight = weight;
        this.maxPassengers = maxPassengers;
    }

    public int getBoardNumber() {
        return this.boardNumber;
    }

    public int getWeight() {
        return this.weight;
    }

    public int getMaxPassengers() {
        return this.maxPassengers;
    }

    @Override
    public String toString() {
        return "Bus {" +
                "\n\tplate='" + this.getPlate() + '\'' +
                ",\n\tbrand='" + this.getBrand() + '\'' +
                ",\n\tmodel='" + this.getModel() + '\'' +
                ",\n\tpotency=" + this.getPotency() +
                ",\n\tboardNumber=" + this.getBoardNumber() +
                ",\n\tweight=" + this.getWeight() +
                ",\n\tmaxPassengers=" + this.getMaxPassengers() +
                ",\n\tlastTripKm=" + this.lastTrip() +
                ",\n\tkm=" + this.totalDistance() +
                "\n}";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Bus bus = (Bus) o;
        return this.getBoardNumber() == bus.getBoardNumber() && this.getWeight() == bus.getWeight() && this.getMaxPassengers() == bus.getMaxPassengers();
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), this.getBoardNumber(), this.getWeight(), this.getMaxPassengers());
    }
}
