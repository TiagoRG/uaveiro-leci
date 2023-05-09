package aula11.ex4;

import java.util.LinkedList;
import java.util.Objects;

public record Company(String code, String name, LinkedList<Flight> flights) {

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Company company)) return false;
        return Objects.equals(code, company.code) && Objects.equals(name, company.name) && Objects.equals(flights, company.flights);
    }

    @Override
    public int hashCode() {
        return Objects.hash(code, name, flights);
    }
}
