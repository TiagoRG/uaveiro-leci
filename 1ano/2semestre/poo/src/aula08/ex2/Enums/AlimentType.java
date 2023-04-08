package aula08.ex2.Enums;

public enum AlimentType {
    MEAT, FISH, CEREAL, VEGETABLE;

    public static AlimentType fromString(String string) {
        return switch (string) {
            case "MEAT", "Meat", "meat" -> MEAT;
            case "FISH", "Fish", "fish" -> FISH;
            case "CEREAL", "Cereal", "cereal" -> CEREAL;
            case "VEGETABLE", "Vegetable", "vegetable" -> VEGETABLE;
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
