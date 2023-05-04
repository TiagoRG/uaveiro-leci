package aula08.ex1.Enums;

public enum EngineType {
    FUEL, ELECTRIC;

    public static EngineType fromString(String string) {
        return switch (string.toUpperCase()) {
            case "FUEL" -> FUEL;
            case "ELECTRIC" -> ELECTRIC;
            default -> null;
        };
    }
}
