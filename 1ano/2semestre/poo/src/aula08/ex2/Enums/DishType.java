package aula08.ex2.Enums;

public enum DishType {
    NORMAL, VEGAN, DIET;

    public static DishType fromString(String string) {
        return switch (string.toUpperCase()) {
            case "NORMAL" -> NORMAL;
            case "VEGAN" -> VEGAN;
            case "DIET" -> DIET;
            default -> null;
        };
    }

    @Override
    public String toString() {
        return switch (this) {
            case NORMAL -> "NORMAL";
            case VEGAN -> "VEGAN";
            case DIET -> "DIET";
        };
    }
}
