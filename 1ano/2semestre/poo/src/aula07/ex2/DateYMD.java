package aula07.ex2;

import java.util.Objects;

public class DateYMD extends Date {
    private int day;
    private int month;
    private int year;

    public DateYMD(int day, int month, int year) {
        set(day, month, year);
    }

    public void set(int day, int month, int year) {
        if (!validDate(day, month, year))
            throw new IllegalArgumentException("Invalid date");
        this.day = day;
        this.month = month;
        this.year = year;
    }

    @Override
    public int getAbsDay() {
        int absDay = 0;
        for (int i = 2000; i < this.year; i++) {
            if (isLeapYear(i))
                absDay += 366;
            else
                absDay += 365;
        }
        for (int i = 1; i < this.month; i++) {
            absDay += monthDays(i, this.year);
        }
        return absDay + this.day;
    }

    @Override
    public int getDay() {
        return this.day;
    }

    @Override
    public int getMonth() {
        return this.month;
    }

    @Override
    public int getYear() {
        return this.year;
    }

    @Override
    public void increment() {
        if (this.day < monthDays(this.month, this.year))
            this.day++;
        else {
            this.day = 1;
            if (this.month < 12)
                this.month++;
            else {
                this.month = 1;
                this.year++;
            }
        }
    }

    @Override
    public void decrement() {
        if (this.day > 1)
            this.day--;
        else {
            this.day = monthDays(this.month == 1 ? 12 : this.month - 1, this.year);
            if (this.month > 1)
                this.month--;
            else {
                this.month = 12;
                this.year--;
            }
        }
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
        return String.format("%02d-%02d-%04d", this.day, this.month, this.year);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        DateYMD dateYMD = (DateYMD) o;
        return day == dateYMD.day && month == dateYMD.month && year == dateYMD.year;
    }

    @Override
    public int hashCode() {
        return Objects.hash(day, month, year);
    }
}
