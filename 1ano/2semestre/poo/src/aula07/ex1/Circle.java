package aula07.ex1;

import java.util.Objects;

public class Circle extends Shape {
    private double radius;

    public Circle(String color, double radius) {
        this.setColor(color);
        this.setRadius(radius);
    }

    public double getRadius() {
        return this.radius;
    }

    public void setRadius(double radius) {
        if (radius <= 0)
            throw new IllegalArgumentException("Sizes must be positive.");
        this.radius = radius;
    }

    public String getColor() {
        return this.color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    @Override
    public double getArea() {
        return Math.PI * Math.pow(this.radius, 2);
    }

    @Override
    public double getPerimeter() {
        return 2 * Math.PI * this.radius;
    }

    @Override
    public boolean equals(Shape s2) {
        if (s2 instanceof Circle s2Circ)
            return Objects.equals(this.color, s2Circ.color) && this.radius == s2Circ.radius;
        return false;
    }

    @Override
    public String toString() {
        return "Circle with radius " + this.radius;
    }
}
