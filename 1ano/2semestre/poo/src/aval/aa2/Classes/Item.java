package aval.aa2.Classes;

import java.util.Objects;

public record Item(String name, double price) {

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Item item)) return false;
        return Double.compare(item.price(), price()) == 0 && Objects.equals(name(), item.name());
    }

    @Override
    public int hashCode() {
        return Objects.hash(name(), price());
    }

    @Override
    public String toString() {
        return String.format("%s: %.2f", name, price);
    }
}
