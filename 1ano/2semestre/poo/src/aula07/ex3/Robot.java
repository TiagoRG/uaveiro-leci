package aula07.ex3;

public class Robot extends MovableObject {
    public static int currentID = 0;
    private final int id;
    private PlayerPosition playerPosition;
    private int goalsScored = 0;

    public Robot(double initialX, double initialY, PlayerPosition playerPosition) {
        super(initialX, initialY);
        this.id = ++Robot.currentID;
        setPlayerPosition(playerPosition);
    }

    public Robot(PlayerPosition playerPosition) {
        this(0, 0, playerPosition);
    }

    public int getId() {
        return this.id;
    }

    public PlayerPosition getPlayerPosition() {
        return this.playerPosition;
    }

    public void setPlayerPosition(PlayerPosition playerPosition) {
        this.playerPosition = playerPosition;
    }

    public int getGoalsScored() {
        return this.goalsScored;
    }

    public void increaseGoalsScored() {
        this.goalsScored++;
    }

    @Override
    public String toString() {
        return String.format("Robot %d (%s) at (%.2f, %.2f) with %.2f travelled distance and %d goals scored",
                this.id, this.playerPosition, this.x, this.y, this.distanceTravelled, this.goalsScored);
    }
}
