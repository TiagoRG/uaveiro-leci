package aula08.ex2.Aliments;

import aula08.ex2.Enums.AlimentOrigin;
import aula08.ex2.Enums.MeatType;

import java.util.Objects;

public class Meat extends Aliment {
    private MeatType meatType;

    public Meat(MeatType meatType, double proteins, double calories, double weight) {
        super(proteins, calories, weight, AlimentOrigin.ANIMAL);
        setMeatType(meatType);
    }

    public MeatType getMeatType() {
        return this.meatType;
    }

    public void setMeatType(MeatType meatType) {
        this.meatType = meatType;
    }

    @Override
    public String toString() {
        return String.format("Meat %s, Proteins: %.1f, Calories: %.1f, Weight: %.1f", this.getMeatType().toString(), this.getProteins(), this.getCalories(), this.getWeight());
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Meat meat = (Meat) o;
        return getMeatType() == meat.getMeatType();
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), getMeatType());
    }
}
