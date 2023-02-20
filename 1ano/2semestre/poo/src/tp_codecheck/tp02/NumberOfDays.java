package tp_codecheck.tp02;

import java.util.Scanner;

public class NumberOfDays {
    public static void main(String[] args)
    {
        // Declare and initialize daysOfMonth
        int[] daysOfMonth = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

        Scanner in = new Scanner(System.in);
        System.out.print("Month (1 - 12): ");
        int month = in.nextInt();
        System.out.print("Year: ");
        int year = in.nextInt();

        if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) {
            // It's a leap year. Adjust the entry for February
            daysOfMonth[1]+=1;
        }

        // Get the number of days in the given month
        int days = daysOfMonth[month-1];

        System.out.println("Number of days: " + days);
    }
}
