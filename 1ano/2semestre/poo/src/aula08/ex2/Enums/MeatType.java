package aula08.ex2.Enums;

public enum MeatType {
    COW, PORK, TURKEY, CHICKEN, OTHER;

    public static MeatType fromString(String string) {
        return switch (string.toUpperCase()) {
            case "COW" -> COW;
            case "PORK" -> PORK;
            case "TURKEY" -> TURKEY;
            case "CHICKEN" -> CHICKEN;
            default -> OTHER;
        };
    }

    @Override
    public String toString() {
        return switch (this) {
            case COW -> "COW";
            case PORK -> "PORK";
            case TURKEY -> "TURKEY";
            case CHICKEN -> "CHICKEN";
            default -> "OTHER";
        };
    }
}
