package aula08.ex2.Enums;

public enum AlimentType {
    MEAT, FISH, CEREAL, VEGETABLE;

    public static AlimentType fromString(String string) {
        return switch (string.toUpperCase()) {
            case "MEAT" -> MEAT;
            case "FISH" -> FISH;
            case "CEREAL" -> CEREAL;
            case "VEGETABLE" -> VEGETABLE;
            default -> null;
        };
    }

    @Override
    public String toString() {
        return switch (this) {
            case MEAT -> "Meat";
            case FISH -> "Fish";
            case CEREAL -> "Cereal";
            case VEGETABLE -> "Vegetable";
        };
    }
}
