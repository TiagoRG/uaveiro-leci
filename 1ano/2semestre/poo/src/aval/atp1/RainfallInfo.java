package aval.atp1;

import java.time.LocalDate;
// YOU MAY ADD IMPORTS HERE

public class RainfallInfo {
    private final LocalDate date;
    private final String location;
    private final double rainfall;

    public RainfallInfo(LocalDate date, String location, double rainfall) {
        this.date = date;
        this.location = location;
        this.rainfall = rainfall;
    }

    public LocalDate date() {
        return date;
    }

    public String location() {
        return location;
    }

    public double rainfall() {
        return rainfall;
    }

    // YOU MAY ADD METHODS HERE
    @Override
    public String toString() {
        return String.format("(%s, %s, %.1f)", date(), location(), rainfall());
    }


    @Override
    public int hashCode() {
        return date.hashCode() | location.hashCode() | Double.hashCode(rainfall);
    }
}
