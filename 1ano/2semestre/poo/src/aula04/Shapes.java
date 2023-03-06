package aula04;

class Circle {
    public double radius;
    
    public Circle(double radius) {
        assert radius > 0;
        this.radius = radius;
    }

    public double getRadius() {
        return this.radius;
    }

    public void setRadius(double radius) {
        assert radius > 0;
        this.radius = radius;
    }

    public boolean equals(Circle c2) {
        return this.radius == c2.radius;
    }

    public String toString() {
        return "Circle with radius " + this.radius;
    }

    public double getArea() {
        return Math.PI * Math.pow(this.radius, 2);
    }

    public double getPerimeter() {
        return 2 * Math.PI * this.radius;
    }
}

class Triangle {
    public double side1;
    public double side2;
    public double side3;

    public Triangle(double side1, double side2, double side3) {
        assert side1 > 0 && side2 > 0 && side3 > 0;
        this.side1 = side1;
        this.side2 = side2;
        this.side3 = side3;
    }

    public double[] getSides() {
        return new double[] {this.side1, this.side2, this.side3};
    }

    public void setSides(double side1, double side2, double side3) {
        assert side1 > 0 && side2 > 0 && side3 > 0;
        this.side1 = side1;
        this.side2 = side2;
        this.side3 = side3;
    }

    public boolean equals(Triangle c2) {
        return this.side1 == c2.side1 && this.side2 == c2.side2 && this.side3 == c2.side3;
    }

    public String toString() {
        return "Triangle with sides " + this.side1 + ", " + this.side2 + ", " + this.side3;
    }

    public double getArea() {
        double p = this.getPerimeter() / 2;
        return Math.sqrt(p * (p - this.side1) * (p - this.side2) * (p - this.side3));
    }

    public double getPerimeter() {
        return this.side1 + this.side2 + this.side3;
    }
}

class Rectangle {
    public double side1;
    public double side2;

    public Rectangle(double side1, double side2) {
        assert side1 > 0 && side2 > 0;
        this.side1 = side1;
        this.side2 = side2;
    }

    public double[] getSides() {
        return new double[] {this.side1, this.side2};
    }

    public void setSides(double side1, double side2) {
        assert side1 > 0 && side2 > 0;
        this.side1 = side1;
        this.side2 = side2;
    }

    public boolean equals(Rectangle c2) {
        return this.side1 == c2.side1 && this.side2 == c2.side2;
    }

    public String toString() {
        return "Rectangle with sides " + this.side1 + ", " + this.side2;
    }

    public double getArea() {
        return this.side1 * this.side2;
    }

    public double getPerimeter() {
        return 2 * (this.side1 + this.side2);
    }
}

public class Shapes {
    public static void main(String[] args) {
    }
}
