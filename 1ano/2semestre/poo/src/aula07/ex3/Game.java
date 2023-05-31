package aula07.ex3;

public class Game {
    private final Team team1;
    private final Team team2;
    private final Ball ball;
    private final double gameDuration;
    private int team1Goals;
    private int team2Goals;
    private double timeElapsed;

    public Game(Team team1, Team team2, Ball ball, double gameDuration) {
        this.team1 = team1;
        this.team2 = team2;
        this.ball = ball;
        this.gameDuration = gameDuration * 60;
        this.timeElapsed = 0;
    }

    public double getGameDuration() {
        return this.gameDuration;
    }

    public double getTimeElapsed() {
        return this.timeElapsed;
    }

    public Team getTeam1() {
        return this.team1;
    }

    public Team getTeam2() {
        return this.team2;
    }

    public void start() {
        new Thread(() -> {
            while (this.timeElapsed < this.gameDuration) {
                this.timeElapsed += 0.1;
                if (this.timeElapsed % 60 == 0)
                    System.out.printf("Tempo: %d minutos", (int) this.timeElapsed / 60);
                try {
                    Thread.sleep(100);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }

    public void moveBall(double newX, double newY) {
        this.ball.move(newX, newY);
    }

    public void moveRobot(int robotId, double newX, double newY) {
        for (Robot r : this.team1.getRobots())
            if (r.getId() == robotId)
                r.move(newX, newY);
        for (Robot r : this.team2.getRobots())
            if (r.getId() == robotId)
                r.move(newX, newY);
    }

    public void addGoal(Team team, int scorerId) {
        if (team == this.team1) {
            this.team1Goals++;
            this.team1.increaseGoalsScored(scorerId);
            this.team2.increaseGoalsTaken();
        } else {
            this.team2Goals++;
            this.team2.increaseGoalsScored(scorerId);
            this.team1.increaseGoalsTaken();
        }
    }

    @Override
    public String toString() {
        return this.team1.getName() + " vs " + this.team2.getName() + ": " + this.team1Goals + "-" + this.team2Goals + "\nBola: " + this.ball.getColor();
    }
}
