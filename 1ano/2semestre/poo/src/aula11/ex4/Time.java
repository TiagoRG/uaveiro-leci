package aula11.ex4;

public class Time {
    private int hour;
    private int minute;

    public Time(int hour, int minute) {
        if (hour < 0 || hour > 23 || minute < 0 || minute > 59)
            throw new IllegalArgumentException("Invalid time");
        this.hour = hour;
        this.minute = minute;
    }

    public static int timeToMinsInt(Time time) {
        return time.hour() * 60 + time.minute();
    }

    public static Time minsIntToTime(int mins) {
        return new Time(mins / 60, mins % 60);
    }

    public Time addTime(Time time) {
        int newHour = hour + time.hour();
        int newMinute = minute + time.minute();
        if (newMinute >= 60) {
            newHour++;
            newMinute -= 60;
        }
        if (newHour >= 24)
            newHour -= 24;
        this.hour = newHour;
        this.minute = newMinute;
        return new Time(newHour, newMinute);
    }

    public boolean isZero() {
        return hour == 0 && minute == 0;
    }

    @Override
    public String toString() {
        return String.format("%02d:%02d", hour, minute);
    }

    public int hour() {
        return hour;
    }

    public int minute() {
        return minute;
    }
}
