package aula09.ex3;

import java.util.Objects;

public class Plane {
    private final String id;
    private String manufacturer;
    private String model;
    private int productionYear;
    private int maxPassengers;
    private double maxSpeed;

    public Plane(String id, String manufacturer, String model, int productionYear, int maxPassengers, double maxSpeed) {
        this.id = id;
        this.manufacturer = manufacturer;
        this.model = model;
        this.productionYear = productionYear;
        this.maxPassengers = maxPassengers;
        this.maxSpeed = maxSpeed;
    }


    public String getId() {
        return id;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getProductionYear() {
        return productionYear;
    }

    public void setProductionYear(int productionYear) {
        this.productionYear = productionYear;
    }

    public int getMaxPassengers() {
        return maxPassengers;
    }

    public void setMaxPassengers(int maxPassengers) {
        this.maxPassengers = maxPassengers;
    }

    public double getMaxSpeed() {
        return maxSpeed;
    }

    public void setMaxSpeed(double maxSpeed) {
        this.maxSpeed = maxSpeed;
    }

    @Override
    public String toString() {
        return "Plane {" +
                "\n\tid='" + id + '\'' +
                ",\n\tmanufacturer='" + manufacturer + '\'' +
                ",\n\tmodel='" + model + '\'' +
                ",\n\tproductionYear=" + productionYear +
                ",\n\tmaxPassengers=" + maxPassengers +
                ",\n\tmaxSpeed=" + maxSpeed +
                ",\n}";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Plane plane)) return false;
        return this.getProductionYear() == plane.getProductionYear() && this.getMaxPassengers() == plane.getMaxPassengers() && Double.compare(plane.getMaxSpeed(), this.getMaxSpeed()) == 0 && Objects.equals(this.getId(), plane.getId()) && Objects.equals(this.getManufacturer(), plane.getManufacturer()) && Objects.equals(this.getModel(), plane.getModel());
    }

    @Override
    public int hashCode() {
        return Objects.hash(this.getId(), this.getManufacturer(), this.getModel(), this.getProductionYear(), this.getMaxPassengers(), this.getMaxSpeed());
    }
}
