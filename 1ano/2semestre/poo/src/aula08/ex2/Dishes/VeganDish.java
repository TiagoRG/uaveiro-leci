package aula08.ex2.Dishes;

import aula08.ex2.Aliments.Aliment;
import aula08.ex2.Enums.AlimentOrigin;

public class VeganDish extends Dish {
    public VeganDish(String name) {
        super(name);
    }

    @Override
    public void addAliment(Aliment aliment) {
        if (aliment.getAlimentOrigin() == AlimentOrigin.ANIMAL)
            throw new IllegalArgumentException("Aliment must be vegan.");
        super.addAliment(aliment);
    }

    @Override
    public String toString() {
        return String.format("Dish '%s', using %d aliments - Vegan dish", this.getName(), this.getAlimentCount());
    }
}
