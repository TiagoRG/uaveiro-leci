package aula07.ex3;

public class Team {
    private final String name;
    private String coach;
    private int goalsScored = 0;
    private int goalsTaken = 0;
    private Robot[] robots;

    public Team(String name, String coach, Robot[] robots) {
        this.name = name;
        this.coach = coach;
        this.setRobots(robots);
    }

    public String getName() {
        return this.name;
    }

    public String getCoach() {
        return this.coach;
    }

    public void setCoach(String coach) {
        this.coach = coach;
    }

    public int getGoalsScored() {
        return this.goalsScored;
    }

    public void increaseGoalsScored(int scorerId) {
        for (Robot r : this.robots)
            if (r.getId() == scorerId)
                r.increaseGoalsScored();
        this.goalsScored++;
    }

    public int getGoalsTaken() {
        return this.goalsTaken;
    }

    public void increaseGoalsTaken() {
        this.goalsTaken++;
    }

    public Robot[] getRobots() {
        return this.robots;
    }

    public void setRobots(Robot[] robots) {
        this.robots = robots;
    }

    public void addRobot(Robot robot) {
        if (this.robots == null)
            this.setRobots(new Robot[]{robot});
        else {
            Robot[] newRobots = new Robot[this.robots.length + 1];
            System.arraycopy(this.robots, 0, newRobots, 0, this.robots.length);
            newRobots[newRobots.length - 1] = robot;
            this.setRobots(newRobots);
        }
    }

    public void removeRobot(Robot robot) {
        Robot[] newRobots = new Robot[this.robots.length - 1];
        int index = 0;
        for (Robot r : this.robots)
            if (r.getId() != robot.getId()) {
                newRobots[index] = r;
                index++;
            }
        this.setRobots(newRobots);
    }

    @Override
    public String toString() {
        StringBuilder robotsString = new StringBuilder();
        for (Robot r : this.robots)
            robotsString.append("\n\t\t").append(r.toString());
        return String.format("Team %s\n\tCoach: %s\n\tGoals Scored: %d\n\tGoals Taken: %d\n\tRobots:%s",
                this.name, this.coach, this.goalsScored, this.goalsTaken, robotsString);
    }
}
