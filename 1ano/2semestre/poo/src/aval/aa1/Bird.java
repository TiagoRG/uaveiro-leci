package aval.aa1;

import java.util.Objects;

public class Bird extends Animal {
    private String habitat;

    public Bird(String name, int weight, int age, String habitat, String sponsor) {
        super(name, weight, age, sponsor);
        this.habitat = habitat;
    }

    public Bird(String name, int weight, int age, String habitat) {
        super(name, weight, age);
        this.habitat = habitat;
    }

    public String gethabitat() {
        return this.habitat;
    }

    public void sethabitat(String habitat) {
        this.habitat = habitat;
    }

    @Override
    public String toString() {
        return "Bird of habitat " + habitat + "\n" + super.toString();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Bird bird = (Bird) o;
        return Objects.equals(habitat, bird.habitat);
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), habitat);
    }
}
