package aula08.ex2.Dishes;

import aula08.ex2.Aliments.Aliment;

import java.util.Objects;

public class DietDish extends Dish {
    private final double maxCalories;

    public DietDish(String name, double maxCalories) {
        super(name);
        this.maxCalories = maxCalories;
    }

    @Override
    public void addAliment(Aliment aliment) {
        if (aliment.getCalories() > (maxCalories - this.calculateCalories()))
            throw new IllegalArgumentException("Aliment is over calories limit.");
        super.addAliment(aliment);
    }

    @Override
    public String toString() {
        return String.format("Dish '%s', using %d aliments - Diet (%.1f calories)", this.getName(), this.getAlimentCount(), this.calculateCalories());
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        DietDish dietDish = (DietDish) o;
        return Double.compare(dietDish.maxCalories, maxCalories) == 0;
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), maxCalories);
    }
}
