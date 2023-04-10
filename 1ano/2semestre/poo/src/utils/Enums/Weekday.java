package utils.Enums;

public enum Weekday {
    MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY;

    public static Weekday fromString(String string) {
        return switch (string) {
            case "MONDAY", "Monday", "monday" -> MONDAY;
            case "TUESDAY", "Tuesday", "tuesday" -> TUESDAY;
            case "WEDNESDAY", "Wednesday", "wednesday" -> WEDNESDAY;
            case "THURSDAY", "Thursday", "thursday" -> THURSDAY;
            case "FRIDAY", "Friday", "friday" -> FRIDAY;
            case "SATURDAY", "Saturday", "saturday" -> SATURDAY;
            case "SUNDAY", "Sunday", "sunday" -> SUNDAY;
            default -> null;
        };
    }

    @Override
    public String toString() {
        return switch (this) {
            case MONDAY -> "MONDAY";
            case TUESDAY -> "TUESDAY";
            case WEDNESDAY -> "WEDNESDAY";
            case THURSDAY -> "THURSDAY";
            case FRIDAY -> "FRIDAY";
            case SATURDAY -> "SATURDAY";
            case SUNDAY -> "SUNDAY";
        };
    }
}
