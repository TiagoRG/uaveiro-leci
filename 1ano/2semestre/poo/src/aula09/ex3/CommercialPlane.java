package aula09.ex3;

import java.util.Objects;

public class CommercialPlane extends Plane {
    private int numOfCrewMembers;

    public CommercialPlane(String id, String manufacturer, String model, int year, int maxNumOfPassengers, double maxSpeed, int numOfCrewMembers) {
        super(id, manufacturer, model, year, maxNumOfPassengers, maxSpeed);
        this.numOfCrewMembers = numOfCrewMembers;
    }

    public int getNumOfCrewMembers() {
        return this.numOfCrewMembers;
    }

    public void setNumOfCrewMembers(int numOfCrewMembers) {
        this.numOfCrewMembers = numOfCrewMembers;
    }

    public String getPlaneType() {
        return "Commercial";
    }

    @Override
    public String toString() {
        return "CommercialPlane {" +
                "\n\tid='" + super.getId() + '\'' +
                ",\n\tmanufacturer='" + super.getManufacturer() + '\'' +
                ",\n\tmodel='" + super.getModel() + '\'' +
                ",\n\tproductionYear=" + super.getProductionYear() +
                ",\n\tmaxPassengers=" + super.getMaxPassengers() +
                ",\n\tmaxSpeed=" + super.getMaxSpeed() +
                ",\n\tnumOfCrewMembers=" + this.getNumOfCrewMembers() +
                ",\n}";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof CommercialPlane plane)) return false;
        if (!super.equals(o)) return false;
        return this.getNumOfCrewMembers() == plane.getNumOfCrewMembers();
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), this.getNumOfCrewMembers());
    }
}
