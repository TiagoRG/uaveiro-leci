package aval.ef_2223.Classes;

import aval.ef_2223.Classes.CampingSpaces.CampingSpace;

import java.time.LocalDate;
import java.util.Objects;

public class Booking {
    private CampingSpace campingSpace;
    private LocalDate startDate;
    private LocalDate endDate;

    public Booking(CampingSpace campingSpace, LocalDate startDate, LocalDate endDate) {
        this.campingSpace = campingSpace;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public CampingSpace getCampingSpace() {
        return campingSpace;
    }

    public void setCampingSpace(CampingSpace campingSpace) {
        this.campingSpace = campingSpace;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Booking booking)) return false;
        return Objects.equals(getCampingSpace(), booking.getCampingSpace()) && Objects.equals(getStartDate(), booking.getStartDate()) && Objects.equals(getEndDate(), booking.getEndDate());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getCampingSpace(), getStartDate(), getEndDate());
    }
}
