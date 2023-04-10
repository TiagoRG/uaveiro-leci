package aula08.ex2.Enums;

public enum FishState {
    FRESH, FROZEN;

    public static FishState fromString(String string) {
        return switch (string) {
            case "FRESH", "Fresh", "fresh" -> FRESH;
            case "FROZEN", "Frozen", "frozen" -> FROZEN;
            default -> null;
        };
    }

    @Override
    public String toString() {
        return switch (this) {
            case FRESH -> "FRESH";
            case FROZEN -> "FROZEN";
        };
    }
}
