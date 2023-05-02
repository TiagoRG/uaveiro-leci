package utils;

import java.util.regex.Pattern;

public class Validations {
    public static boolean validateEmail(String email) {
        return Pattern.matches("^[a-zA-Z0-9._]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$", email);
    }

    public static boolean validateVehiclePlate(String plate) {
        return Pattern.matches("^[A-Z]{2}-\\d{2}-\\d{2}|\\d{2}-[A-Z]{2}-\\d{2}|\\d{2}-\\d{2}-[A-Z]{2}|[A-Z]{2}-\\d{2}-[A-Z]{2}|[A-Z]{2}-[A-Z]{2}-\\d{2}|\\d{2}-[A-Z]{2}-[A-Z]{2}$", plate);
    }
}
