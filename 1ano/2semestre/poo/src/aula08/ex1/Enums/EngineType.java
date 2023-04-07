package aula08.ex1.Enums;

public enum EngineType {
    FUEL, ELECTRIC;

    public static EngineType fromString(String string) {
        return switch (string) {
            case "FUEL", "Fuel", "fuel" -> EngineType.FUEL;
            case "ELECTRIC", "Electric", "electric" -> EngineType.ELECTRIC;
            default -> null;
        };
    }
}
