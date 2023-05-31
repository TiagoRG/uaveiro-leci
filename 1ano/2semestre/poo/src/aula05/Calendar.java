package aula05;

import java.util.Arrays;
import java.util.Scanner;

public class Calendar {
    private final int year;
    private final int firstDayOfWeek;
    private final int[][] events;

    public Calendar(int year, int firstDayOfWeek) {
        this.year = year;
        this.firstDayOfWeek = firstDayOfWeek;
        this.events = new int[366][3];
    }

    public int getYear() {
        return this.year;
    }

    public int getFirstDayOfWeek() {
        return this.firstDayOfWeek;
    }

    public int firstWeekdayOfMonth(int month) {
        int day = this.firstDayOfWeek;
        for (int m = 1; m < month; m++) {
            if (day == 7)
                day = 0;
            int days = DateYMD.monthDays(m, this.year);
            day += days % 7 - 1;
            if (day > 7)
                day -= 7;
            day++;
        }
        return day == 7 ? 7 : day % 7;
    }

    public void printMonth(int month) {
        String[] monthNames = {"Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"};
        System.out.printf("\n%15s %d\n", monthNames[month - 1], year);
        System.out.println("Dom Seg Ter Qua Qui Sex Sab");

        int firstWeekday = this.firstWeekdayOfMonth(month);
        for (int i = 1; i < firstWeekday; i++)
            System.out.print("    ");

        for (int monthDay = 1; monthDay <= monthDays(month, year); monthDay++) {
            System.out.print(this.isEvent(monthDay, month, this.year) ? String.format("*%2d ", monthDay) : String.format("%3d ", monthDay));
            if ((monthDay + firstWeekday - 1) % 7 == 0)
                System.out.println();
        }
        System.out.println();
    }

    public void addEvent(int day, int month, int year) {
        int[] eventToAdd = {day, month, year};
        for (int i = 0; i < this.events.length; i++) {
            if (Arrays.equals(this.events[i], new int[]{0, 0, 0})) {
                this.events[i] = eventToAdd;
                break;
            }
        }
    }

    public void removeEvent(int day, int month, int year) {
        int[] eventToRemove = {day, month, year};
        for (int i = 0; i < this.events.length; i++) {
            if (this.events[i] == eventToRemove) {
                this.events[i] = new int[]{0, 0, 0};
                break;
            }
        }
    }

    private boolean isEvent(int day, int month, int year) {
        int[] event = {day, month, year};
        for (int[] ints : this.events) {
            if (Arrays.equals(ints, event))
                return true;
        }
        return false;
    }

    private int monthDays(int month, int year) {
        switch (month) {
            case 2 -> {
                if (year % 100 == 0 ? year % 400 == 0 : year % 4 == 0)
                    return 29;
                else
                    return 28;
            }
            case 4, 6, 9, 11 -> {
                return 30;
            }
            default -> {
                return 31;
            }
        }
    }
}

class Tester {
    public static void main(String[] args) {
        Scanner sin = new Scanner(System.in);
        Calendar calendar = null;
        while (true) {
            System.out.print("Calendar operations:\n1 - create new calendar\n2 - print calendar month\n3 - print calendar\n4 - add event\n5 - remove event\n6 - exit\n> ");
            int op = sin.nextInt();
            switch (op) {
                case 1 -> {
                    System.out.print("Year: ");
                    int year = sin.nextInt();
                    System.out.print("First day of week: ");
                    int firstDayOfWeek = sin.nextInt();
                    calendar = new Calendar(year, firstDayOfWeek);
                }
                case 2 -> {
                    if (calendar == null) {
                        System.out.println("Create a calendar first");
                        break;
                    }
                    System.out.print("Month: ");
                    int month = sin.nextInt();
                    calendar.printMonth(month);
                }
                case 3 -> {
                    if (calendar == null) {
                        System.out.println("Create a calendar first");
                        break;
                    }
                    for (int month = 1; month <= 12; month++)
                        calendar.printMonth(month);
                }
                case 4 -> {
                    if (calendar == null) {
                        System.out.println("Create a calendar first");
                        break;
                    }
                    System.out.print("Day: ");
                    int day = sin.nextInt();
                    System.out.print("Month: ");
                    int month = sin.nextInt();
                    System.out.print("Year: ");
                    int year = sin.nextInt();
                    calendar.addEvent(day, month, year);
                }
                case 5 -> {
                    if (calendar == null) {
                        System.out.println("Create a calendar first");
                        break;
                    }
                    System.out.print("Day: ");
                    int day = sin.nextInt();
                    System.out.print("Month: ");
                    int month = sin.nextInt();
                    System.out.print("Year: ");
                    int year = sin.nextInt();
                    calendar.removeEvent(day, month, year);
                }
                case 6 -> {
                    sin.close();
                    System.exit(0);
                }
                default -> System.out.println("Invalid option");
            }
        }
    }
}
