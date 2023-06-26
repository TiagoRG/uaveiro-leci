package aval.ef_2223.Enums;

public enum SpaceType {
    CARAVAN, CAR, TENT;

    public static SpaceType fromString(String type) {
        return switch (type.toLowerCase()) {
            case "caravan" -> CARAVAN;
            case "car" -> CAR;
            case "tent" -> TENT;
            default -> null;
        };
    }

    @Override
    public String toString() {
        return switch (this) {
            case CARAVAN -> "Caravan";
            case CAR -> "Car";
            case TENT -> "Tent";
        };
    }
}
