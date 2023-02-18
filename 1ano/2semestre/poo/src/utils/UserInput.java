package utils;

import java.util.Scanner;

public class UserInput {
    public static double getNumberBetween(Scanner sin, double min, double max) {
        double input;
        do {
            input = sin.nextDouble();
        } while (input > max || input < min);
        return input;
    }

    public static double getPositiveNumber(Scanner sin) {
        double input;
        do {
            input = sin.nextDouble();
        } while (input <= 0);
        return input;
    }
}
