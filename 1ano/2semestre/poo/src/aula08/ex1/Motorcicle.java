package aula08.ex1;

import java.util.Objects;

public class Motorcicle extends Vehicle {
    private final MotorcicleType type;

    public Motorcicle(String plate, String brand, String model, int potency, MotorcicleType type) {
        super(plate, brand, model, potency);
        this.type = type;
    }

    public Motorcicle(Motorcicle motorcicle) {
        this(motorcicle.getPlate(), motorcicle.getBrand(), motorcicle.getModel(), motorcicle.getPotency(), motorcicle.getType());
    }

    public MotorcicleType getType() {
        return this.type;
    }

    @Override
    public String toString() {
        return "Motorcicle {" +
        "\n\tplate='" + this.getPlate() + '\'' +
        ",\n\tbrand='" + this.getBrand() + '\'' +
        ",\n\tmodel='" + this.getModel() + '\'' +
        ",\n\tpotency=" + this.getPotency() +
        ",\n\ttype=" + this.getType().toString() +
        ",\n\tlastTripKm=" + this.lastTrip() +
        ",\n\tkm=" + this.totalDistance() +
        "\n}";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Motorcicle that = (Motorcicle) o;
        return this.getType() == that.getType();
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), this.getType());
    }

    enum MotorcicleType {
        SPORT, TOURING;

        public String toString() {
            return switch (this) {
                case SPORT -> "Sport";
                case TOURING -> "Touring";
            };
        }

        public static MotorcicleType fromString(String s) {
            return switch (s) {
                case "SPORT", "Sport", "sport" -> SPORT;
                case "TOURING", "Touring", "touring" -> TOURING;
                default -> throw new IllegalArgumentException("Invalid MotorcicleType: " + s);
            };
        }
    }
}