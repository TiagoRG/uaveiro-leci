package aula08.ex1;

public enum EngineType {
    FUEL, ELETRIC;

    public static EngineType fromString(String string) {
        return switch (string) {
            case "FUEL", "Fuel", "fuel" -> EngineType.FUEL;
            case "ELETRIC", "Eletric", "eletric" -> EngineType.ELETRIC;
            default -> null;
        };
    }
}
