package aula07.ex3;

public enum PlayerPosition {
    GoalKeeper,
    Striker,
    Defender,
    MidFielder;

    public static PlayerPosition getPositionById(int id) {
        return switch (id) {
            case 1 -> GoalKeeper;
            case 2 -> Striker;
            case 3 -> Defender;
            case 4 -> MidFielder;
            default -> null;
        };
    }

    public String toString() {
        return switch (this) {
            case GoalKeeper -> "GoalKeeper";
            case Striker -> "Striker";
            case Defender -> "Defender";
            case MidFielder -> "MidFielder";
        };
    }
}
