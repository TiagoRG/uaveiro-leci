package aula07.ex1;

public class Rectangle extends Shape {
    public double side1;
    public double side2;

    public Rectangle(double side1, double side2) {
        if (!(side1 > 0 && side2 > 0))
            throw new IllegalArgumentException("Sizes must be positive.");
        this.side1 = side1;
        this.side2 = side2;
    }

    public double[] getSides() {
        return new double[] {this.side1, this.side2};
    }

    public void setSides(double side1, double side2) {
        if (!(side1 > 0 && side2 > 0))
            throw new IllegalArgumentException("Sizes must be positive.");
        this.side1 = side1;
        this.side2 = side2;
    }

    @Override
    public boolean equals(Shape s2) {
        if (s2 instanceof Rectangle s2Rect)
            return this.side1 == s2Rect.side1 && this.side2 == s2Rect.side2;
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
