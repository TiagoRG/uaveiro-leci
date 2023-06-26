package aval.ef_2223.Classes.CampingSpaces;

import aval.ef_2223.Enums.SpaceType;

import java.util.Arrays;
import java.util.Objects;

public abstract class CampingSpace {
    private SpaceType spaceType;
    private String location;
    private int[] sizes;
    private double pricePerNight;


    public CampingSpace(String location, int[] sizes, double pricePerNight) {
        this.location = location;
        this.sizes = sizes;
        this.pricePerNight = pricePerNight;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int[] getSizes() {
        return sizes;
    }

    public void setSizes(int[] sizes) {
        this.sizes = sizes;
    }

    public double getPricePerNight() {
        return pricePerNight;
    }

    public void setPricePerNight(double pricePerNight) {
        this.pricePerNight = pricePerNight;
    }

    public SpaceType getType() {
        return spaceType;
    }

    public void setSpaceType(SpaceType spaceType) {
        this.spaceType = spaceType;
    }

    public boolean checkMinDimentions(CampingSpace space2, int[] dimentions) {
        return space2.getSizes()[0] >= dimentions[0] && space2.getSizes()[1] >= dimentions[1];
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof CampingSpace that)) return false;
        return Double.compare(that.getPricePerNight(), getPricePerNight()) == 0 && getType() == that.getType() && Objects.equals(getLocation(), that.getLocation()) && Arrays.equals(getSizes(), that.getSizes());
    }

    @Override
    public int hashCode() {
        int result = Objects.hash(getType(), getLocation(), getPricePerNight());
        result = 31 * result + Arrays.hashCode(getSizes());
        return result;
    }

    @Override
    public String toString() {
        return String.format("%s space located in %s, with dimension %dx%d, %.2f/day", getType(), getLocation(), getSizes()[0], getSizes()[1], getPricePerNight());
    }
}
