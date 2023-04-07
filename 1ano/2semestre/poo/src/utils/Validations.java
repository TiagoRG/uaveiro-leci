package utils;

import java.util.regex.Pattern;

public class Validations {
    public static boolean validateVehiclePlate(String plate) {
        return Pattern.matches("^[A-Z]{2}-\\d{2}-\\d{2}|\\d{2}-[A-Z]{2}-\\d{2}|\\d{2}-\\d{2}-[A-Z]{2}|[A-Z]{2}-\\d{2}-[A-Z]{2}|[A-Z]{2}-[A-Z]{2}-\\d{2}|\\d{2}-[A-Z]{2}-[A-Z]{2}$", plate);
    }
}
