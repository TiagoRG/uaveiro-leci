package aula07.ex3;

public class Ball extends MovableObject {
    private String color;

    public Ball(double initialX, double initialY, String color) {
        super(initialX, initialY);
        setColor(color);
    }

    public Ball(String color) {
        this(0, 0, color);
    }

    public String getColor() {
        return this.color;
    }

    public void setColor(String color) {
        this.color = color;
    }
}
