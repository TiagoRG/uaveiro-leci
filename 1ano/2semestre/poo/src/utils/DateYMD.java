package utils;

public class DateYMD {
    private int day;
    private int month;
    private int year;

    public DateYMD(int day, int month, int year) {
        if (!validDate(day, month, year))
            throw new IllegalArgumentException("Invalid date");
        this.day = day;
        this.month = month;
        this.year = year;
    }

    static boolean validMonth(int month) {
        return month >= 1 && month <= 12;
    }

    static int monthDays(int month, int year) {
        if (!validMonth(month))
            return -1;
        int[] daysPerMonth = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
        if (month == 2 && isLeapYear(year))
            return 29;
        return daysPerMonth[month - 1];
    }

    static boolean isLeapYear(int year) {
        return year % 100 == 0 ? year % 400 == 0 : year % 4 == 0;
    }

    public static boolean validDate(int day, int month, int year) {
        return day >= 1 && day <= monthDays(month, year);
    }

    public void set(int day, int month, int year) {
        if (!validDate(day, month, year))
            throw new IllegalArgumentException("Invalid date");
        this.day = day;
        this.month = month;
        this.year = year;
    }

    public int[] get() {
        return new int[]{this.day, this.month, this.year};
    }

    public int getDay() {
        return day;
    }

    public int getMonth() {
        return month;
    }

    public int getYear() {
        return year;
    }

    public void increment() {
        if (this.day < monthDays(this.month, this.year))
            this.day++;
        else if (this.month < 12) {
            this.day = 1;
            this.month++;
        } else {
            this.day = 1;
            this.month = 1;
            this.year++;
        }
    }

    public void addDays(int days) {
        for (int i = 0; i < days; i++)
            this.increment();
    }

    public void decrement() {
        if (this.day > 1)
            this.day--;
        else if (this.month > 1) {
            this.day = monthDays(this.month - 1, this.year);
            this.month--;
        } else {
            this.day = 31;
            this.month = 12;
            this.year--;
        }
    }

    public String toString() {
        return String.format("%04d-%02d-%02d", this.year, this.month, this.day);
    }
}