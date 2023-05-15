package aula08.ex2.Dishes;

import aula08.ex2.Aliments.Aliment;

import java.util.LinkedList;
import java.util.Objects;

public class Dish {
    private final String name;
    private final LinkedList<Aliment> aliments;

    public Dish(String name) {
        this.name = name;
        this.aliments = new LinkedList<>();
    }

    public String getName() {
        return name;
    }

    public LinkedList<Aliment> getAliments() {
        return this.aliments;
    }

    public void addAliment(Aliment aliment) {
        this.aliments.add(aliment);
    }

    public int getAlimentCount() {
        return this.aliments.size();
    }

    public double calculateCalories() {
        double total = 0;
        for (Aliment aliment : this.aliments)
            total += aliment.getCalories();
        return total;
    }

    public double calculateProteins() {
        double total = 0;
        for (Aliment aliment : this.aliments)
            total += aliment.getProteins();
        return total;
    }

    public double calculateWeight() {
        double total = 0;
        for (Aliment aliment : this.aliments)
            total += aliment.getWeight();
        return total;
    }

    @Override
    public String toString() {
        return String.format("Dish '%s', using %d aliments", this.getName(), this.getAlimentCount());
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Dish dish = (Dish) o;
        return getName().equals(dish.getName()) && getAliments().equals(dish.getAliments());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getName(), getAliments());
    }
}
