package aula08.ex2.Aliments;

import aula08.ex2.Enums.AlimentOrigin;
import aula08.ex2.Enums.FishState;

import java.util.Objects;

public class Fish extends Aliment {
    private FishState fishState;

    public Fish(FishState fishState, double proteins, double calories, double weight) {
        super(proteins, calories, weight, AlimentOrigin.ANIMAL);
        this.fishState = fishState;
    }

    public FishState getFishState() {
        return this.fishState;
    }

    public void setFishState(FishState fishState) {
        this.fishState = fishState;
    }

    @Override
    public String toString() {
        return String.format("Fish %s, Proteins: %.1f, Calories: %.1f, Weight: %.1f", this.getFishState().toString(), this.getProteins(), this.getCalories(), this.getWeight());
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Fish fish = (Fish) o;
        return getFishState() == fish.getFishState();
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), getFishState());
    }
}
