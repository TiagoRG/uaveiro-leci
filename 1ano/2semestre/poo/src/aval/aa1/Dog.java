package aval.aa1;

import java.util.Objects;

public class Dog extends Animal {
    private final String breed;

    public Dog(String name, int weight, int age, String breed, String sponsor) {
        super(name, weight, age, sponsor);
        this.breed = breed;
    }

    public Dog(String name, int weight, int age, String breed) {
        super(name, weight, age);
        this.breed = breed;
    }

    public String getBreed() {
        return this.breed;
    }

    @Override
    public String toString() {
        return "Dog of breed " + this.breed + "\n" + super.toString();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Dog dog = (Dog) o;
        return Objects.equals(breed, dog.breed);
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), breed);
    }
}
