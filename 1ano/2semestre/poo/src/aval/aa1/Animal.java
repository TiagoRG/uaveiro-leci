package aval.aa1;

import java.util.Objects;

public class Animal {
    public static int currentId = 1;
    private final int id;
    private String name;
    private int weight;
    private int age;
    private String sponsor;

    public Animal(String name, int weight, int age, String sponsor) {
        this.id = Animal.currentId++;
        this.name = name;
        this.weight = weight;
        this.age = age;
        this.sponsor = sponsor;
    }

    public Animal(String name, int weight, int age) {
        this(name, weight, age, null);
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        if (weight <= 0)
            throw new IllegalArgumentException("Weight must be positive!");
        this.weight = weight;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        if (age <= 0)
            throw new IllegalArgumentException("Age must be positive!");
        this.age = age;
    }

    public String getSponsor() {
        return sponsor;
    }

    public void setSponsor(String sponsor) {
        this.sponsor = sponsor;
    }

    @Override
    public String toString() {
        return String.format("ID: %d\nName: %s\nAge: %d\nWeight: %d\nSponsor: %s", this.id, this.name, this.age, this.weight, this.sponsor == null ? "None" : sponsor);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Animal animal = (Animal) o;
        return id == animal.id && weight == animal.weight && age == animal.age && Objects.equals(name, animal.name) && Objects.equals(sponsor, animal.sponsor);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, weight, age, sponsor);
    }
}
