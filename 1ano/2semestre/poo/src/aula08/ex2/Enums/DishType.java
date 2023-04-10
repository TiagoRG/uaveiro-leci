package aula08.ex2.Enums;

public enum DishType {
    NORMAL, VEGAN, DIET;

    public static DishType fromString(String string) {
        return switch (string) {
            case "NORMAL", "Normal", "normal" -> NORMAL;
            case "VEGAN", "Vegan", "vegan" -> VEGAN;
            case "DIET", "Diet", "diet" -> DIET;
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
