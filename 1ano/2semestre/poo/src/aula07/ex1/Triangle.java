package aula07.ex1;

import java.util.Objects;

public class Triangle extends Shape {
    private double side1;
    private double side2;
    private double side3;

    public Triangle(String color, double side1, double side2, double side3) {
        this.setColor(color);
        this.setSides(side1, side2, side3);
    }

    public double[] getSides() {
        return new double[]{this.side1, this.side2, this.side3};
    }

    public void setSides(double side1, double side2, double side3) {
        if (!(side1 > 0 && side2 > 0 && side3 > 0))
            throw new IllegalArgumentException("Sizes must be positive.");
        this.side1 = side1;
        this.side2 = side2;
        this.side3 = side3;
    }

    public String getColor() {
        return this.color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    @Override
    public boolean equals(Shape s2) {
        if (s2 instanceof Triangle s2Triang)
            return Objects.equals(this.color, s2Triang.color) && this.side1 == s2Triang.side1 && this.side2 == s2Triang.side2 && this.side3 == s2Triang.side3;
        return false;
    }

    @Override
    public String toString() {
        return "Triangle with sides " + this.side1 + ", " + this.side2 + ", " + this.side3;
    }

    @Override
    public double getArea() {
        double p = this.getPerimeter() / 2;
        return Math.sqrt(p * (p - this.side1) * (p - this.side2) * (p - this.side3));
    }

    @Override
    public double getPerimeter() {
        return this.side1 + this.side2 + this.side3;
    }
}
