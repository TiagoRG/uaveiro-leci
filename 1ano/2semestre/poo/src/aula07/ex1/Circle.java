package aula07.ex1;

public class Circle extends Shape {
    private double radius;

    public Circle(double radius) {
        if (radius <= 0)
            throw new IllegalArgumentException("Sizes must be positive.");
        this.radius = radius;
    }

    public double getRadius() {
        return this.radius;
    }

    public void setRadius(double radius) {
        if (radius <= 0)
            throw new IllegalArgumentException("Sizes must be positive.");
        this.radius = radius;
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
            return this.radius == s2Circ.radius;
        return false;
    }

    @Override
    public String toString() {
        return "Circle with radius " + this.radius;
    }
}
