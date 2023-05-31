package aula07.ex1;

import java.util.Objects;

public class Rectangle extends Shape {
    public double side1;
    public double side2;

    public Rectangle(String color, double side1, double side2) {
        this.setColor(color);
        this.setSides(side1, side2);
    }

    public double[] getSides() {
        return new double[]{this.side1, this.side2};
    }

    public void setSides(double side1, double side2) {
        if (!(side1 > 0 && side2 > 0))
            throw new IllegalArgumentException("Sizes must be positive.");
        this.side1 = side1;
        this.side2 = side2;
    }

    public String getColor() {
        return this.color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    @Override
    public boolean equals(Shape s2) {
        if (s2 instanceof Rectangle s2Rect)
            return Objects.equals(this.color, s2Rect.color) && this.side1 == s2Rect.side1 && this.side2 == s2Rect.side2;
        return false;
    }

    @Override
    public String toString() {
        return "Rectangle with sides " + this.side1 + ", " + this.side2;
    }

    @Override
    public double getArea() {
        return this.side1 * this.side2;
    }

    @Override
    public double getPerimeter() {
        return 2 * (this.side1 + this.side2);
    }
}
