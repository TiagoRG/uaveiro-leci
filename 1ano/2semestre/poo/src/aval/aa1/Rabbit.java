package aval.aa1;

import java.util.Objects;

public class Rabbit extends Animal {
    private String fur;

    public Rabbit(String name, int weight, int age, String fur, String sponsor) {
        super(name, weight, age, sponsor);
        this.fur = fur;
    }

    public Rabbit(String name, int weight, int age, String fur) {
        super(name, weight, age);
        this.fur = fur;
    }

    public String getFur() {
        return this.fur;
    }

    public void setfur(String fur) {
        this.fur = fur;
    }

    @Override
    public String toString() {
        return "Rabbit of fur " + fur + "\n" + super.toString();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Rabbit rabbit = (Rabbit) o;
        return Objects.equals(fur, rabbit.fur);
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), fur);
    }
}
