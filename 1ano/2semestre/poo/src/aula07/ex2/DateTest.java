package aula07.ex2;

import java.util.Scanner;

public class DateTest {
    public static void main(String[] args) {
        Scanner sin = new Scanner(System.in);

        while (true) {
            System.out.print("Class to test (0-Quit;1-DateYMD;2-DateND): ");
            String option = sin.nextLine();

            switch (option) {
                case "0" -> {
                    sin.close();
                    System.exit(0);
                }
                case "1" -> {
                    System.out.print("Day: ");
                    int day = Integer.parseInt(sin.nextLine());
                    System.out.print("Month: ");
                    int month = Integer.parseInt(sin.nextLine());
                    System.out.print("Year: ");
                    int year = Integer.parseInt(sin.nextLine());

                    DateYMD date = new DateYMD(day, month, year);
                    System.out.printf("Initial date: %s%n%n", date);
                    System.out.printf("Absolute day: %d%n", date.getAbsDay());
                    System.out.println("Adding 7 days...");
                    date.addDays(7);
                    System.out.printf("New absolute day: %d%n", date.getAbsDay());
                    System.out.println("Removing 534 days...");
                    date.removeDays(534);
                    System.out.printf("New absolute day: %d%n", date.getAbsDay());
                    System.out.println("Final date: " + date);
                }
                case "2" -> {
                    System.out.print("Days past past 01-01-2000: ");
                    int days = Integer.parseInt(sin.nextLine());

                    DateND date = new DateND(days);
                    System.out.printf("Initial date: %s%n%n", date);
                    System.out.printf("YMD date: %s%n", new DateYMD(date.getDay(), date.getMonth(), date.getYear()));
                    System.out.println("Adding 74 days...");
                    date.addDays(74);
                    System.out.printf("New YMD date: %s%n", new DateYMD(date.getDay(), date.getMonth(), date.getYear()));
                    System.out.println("Removing 612 days...");
                    date.removeDays(612);
                    System.out.printf("New YMD date: %s%n", new DateYMD(date.getDay(), date.getMonth(), date.getYear()));
                    System.out.println("Final date: " + date);
                }
                default -> System.out.println("Invalid option.");
            }
        }
    }
}
