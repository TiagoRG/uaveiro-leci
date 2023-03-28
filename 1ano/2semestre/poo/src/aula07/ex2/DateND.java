package aula07.ex2;

import java.util.Objects;

public class DateND extends Date {
    private int absDay;

    public DateND(int absDay) {
        set(absDay);
    }

    public void set(int absDay) {
        if (absDay <= 0)
            throw new IllegalArgumentException("Absolute day must be positive!");
        this.absDay = absDay;
    }

    @Override
    public int getAbsDay() {
        return this.absDay;
    }

    private int[] getYMD() {
        int[] date = new int[3];

        int tempAbsDay = this.absDay;
        int year = 1999;
        while (tempAbsDay > 0) {
            year++;
            tempAbsDay -= isLeapYear(year) ? 366 : 365;
        }
        date[2] = year;
        tempAbsDay += isLeapYear(year) ? 366 : 365;

        int month = 0;
        while (tempAbsDay > 0) {
            month++;
            tempAbsDay -= monthDays(month, year);
        }
        date[1] = month;
        tempAbsDay += monthDays(month, year);
        date[0] = tempAbsDay;

        return date;
    }

    @Override
    public int getDay() {
        return this.getYMD()[0];
    }

    @Override
    public int getMonth() {
        return this.getYMD()[1];
    }

    @Override
    public int getYear() {
        return this.getYMD()[2];
    }

    @Override
    public void increment() {
        this.absDay++;
    }

    @Override
    public void decrement() {
        this.absDay--;
    }

    @Override
    public void addDays(int days) {
        for (int i = 0; i < days; i++)
            this.increment();
    }

    @Override
    public void removeDays(int days) {
        for (int i = 0; i < days; i++)
            this.decrement();
    }

    @Override
    public String toString() {
        return String.format("Date: %d past 01-01-2000", this.absDay);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        DateND dateND = (DateND) o;
        return absDay == dateND.absDay;
    }

    @Override
    public int hashCode() {
        return Objects.hash(absDay);
    }
}
