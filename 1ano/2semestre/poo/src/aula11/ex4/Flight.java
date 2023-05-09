package aula11.ex4;

import java.util.Objects;

public record Flight(String code, String origin, Time departure, Time delay, Company company) {
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Flight flight)) return false;
        return Objects.equals(code, flight.code) && Objects.equals(origin, flight.origin) && Objects.equals(departure, flight.departure) && Objects.equals(delay, flight.delay);
    }

    @Override
    public int hashCode() {
        return Objects.hash(code, origin, departure, delay);
    }
}
