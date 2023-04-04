package aula07.ex3;

public class MovableObject {
    protected double x;
    protected double y;
    protected double distanceTravelled;

    protected MovableObject(double initialX, double initialY) {
        this.x = initialX;
        this.y = initialY;
        this.distanceTravelled = 0;
    }

    protected MovableObject() {
        this(0, 0);
    }

    protected void move(double newX, double newY) {
        increaseDistanceTravelled(calculateDistanceTravelled(newX, newY));
        this.x = newX;
        this.y = newY;
    }

    protected void increaseDistanceTravelled(double distance) {
        this.distanceTravelled += distance;
    }

    private double calculateDistanceTravelled(double newX, double newY) {
        return Math.sqrt(Math.pow((this.x - newX), 2) + Math.pow(this.y - newY, 2));
    }
}
