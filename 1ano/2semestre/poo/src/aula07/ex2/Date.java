package aula07.ex2;

public abstract class Date {
    public static int monthDays(int month, int year) {
        if (!validMonth(month))
            return -1;
        int[] daysPerMonth = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
        if (month == 2 && isLeapYear(year))
            return 29;
        return daysPerMonth[month - 1];
    }

    public static boolean validMonth(int month) {
        return month >= 1 && month <= 12;
    }

    public static boolean validDate(int day, int month, int year) {
        return day >= 1 && day <= monthDays(month, year);
    }

    public static boolean isLeapYear(int year) {
        return year % 100 == 0 ? year % 400 == 0 : year % 4 == 0;
    }

    public abstract int getAbsDay();

    public abstract int getDay();

    public abstract int getMonth();

    public abstract int getYear();

    public abstract void increment();

    public abstract void decrement();

    public abstract void addDays(int days);

    public abstract void removeDays(int days);
}
