package aula08.ex2.Aliments;

import aula08.ex2.Enums.AlimentOrigin;

import java.util.Objects;

public abstract class Aliment {
    final AlimentOrigin alimentOrigin;
    double proteins;
    double calories;
    double weight;

    public Aliment(double proteins, double calories, double weight, AlimentOrigin alimentOrigin) {
        setProteins(proteins);
        setCalories(calories);
        setCalories(weight);
        this.alimentOrigin = alimentOrigin;
    }

    public double getProteins() {
        return this.proteins;
    }

    public void setProteins(double proteins) {
        if (proteins <= 0)
            throw new IllegalArgumentException("Proteins must be positive");
        this.proteins = proteins;
    }

    public double getCalories() {
        return this.calories;
    }

    public void setCalories(double calories) {
        if (calories <= 0)
            throw new IllegalArgumentException("Calories must be positive");
        this.calories = calories;
    }

    public double getWeight() {
        return this.weight;
    }

    public void setWeight(double weight) {
        if (weight <= 0)
            throw new IllegalArgumentException("Weight must be positive");
        this.weight = weight;
    }

    public AlimentOrigin getAlimentOrigin() {
        return this.alimentOrigin;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Aliment aliment = (Aliment) o;
        return Double.compare(aliment.getProteins(), getProteins()) == 0 && Double.compare(aliment.getCalories(), getCalories()) == 0 && Double.compare(aliment.getWeight(), getWeight()) == 0 && getAlimentOrigin() == aliment.getAlimentOrigin();
    }

    @Override
    public int hashCode() {
        return Objects.hash(getProteins(), getCalories(), getWeight(), getAlimentOrigin());
    }
}
