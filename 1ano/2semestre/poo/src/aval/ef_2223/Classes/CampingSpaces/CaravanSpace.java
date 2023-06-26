package aval.ef_2223.Classes.CampingSpaces;

import aval.ef_2223.Enums.SpaceType;

import java.util.Objects;

public class CaravanSpace extends CampingSpace {

    public CaravanSpace(String location, int[] sizes, double pricePerNight) {
        super(location, sizes, pricePerNight);
        super.setSpaceType(SpaceType.CARAVAN);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof CaravanSpace that)) return false;
        return super.equals(o);
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode());
    }
}
