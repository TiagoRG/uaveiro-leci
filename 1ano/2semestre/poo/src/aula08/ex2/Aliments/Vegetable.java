package aula08.ex2.Aliments;

import aula08.ex2.Enums.AlimentOrigin;

import java.util.Objects;

public class Vegetable extends Aliment {
    private final String name;

    public Vegetable(String name, double proteins, double calories, double weight) {
        super(proteins, calories, weight, AlimentOrigin.VEGAN);
        this.name = name;
    }

    public String getName() {
        return this.name;
    }

    @Override
    public String toString() {
        return String.format("Vegetable %s, Proteins: %.1f, Calories: %.1f, Weight: %.1f", this.getName(), this.getProteins(), this.getCalories(), this.getWeight());
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Vegetable vegetable = (Vegetable) o;
        return getName().equals(vegetable.getName());
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), getName());
    }
}
