package aula04;

import utils.UserInput;

import java.util.Scanner;

class Circle {
    public double radius;

    public Circle(double radius) {
        if (!(radius > 0))
            throw new IllegalArgumentException("Sizes must be positive.");
        this.radius = radius;
    }

    public double getRadius() {
        return this.radius;
    }

    public void setRadius(double radius) {
        if (!(radius > 0))
            throw new IllegalArgumentException("Sizes must be positive.");
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
        if (!(side1 > 0 && side2 > 0 && side3 > 0))
            throw new IllegalArgumentException("Sizes must be positive.");
        if (!(side1 < side2 + side3 && side2 < side1 + side3 && side3 < side1 + side2))
            throw new IllegalArgumentException("Triangle cannot be created with those sides.");
        this.side1 = side1;
        this.side2 = side2;
        this.side3 = side3;
    }

    public double[] getSides() {
        return new double[]{this.side1, this.side2, this.side3};
    }

    public void setSides(double side1, double side2, double side3) {
        if (!(side1 > 0 && side2 > 0 && side3 > 0))
            throw new IllegalArgumentException("Sizes must be positive.");
        if (!(side1 < side2 + side3 && side2 < side1 + side3 && side3 < side1 + side2))
            throw new IllegalArgumentException("Triangle cannot be created with those sides.");
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
        if (!(side1 > 0 && side2 > 0))
            throw new IllegalArgumentException("Sizes must be positive.");
        this.side1 = side1;
        this.side2 = side2;
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
        Scanner sin = new Scanner(System.in);

        while (true) {
            System.out.println("Escolha uma forma:\n0 - Sair\n1 - Retangulo\n2 - Triangulo\n3 - Circulo");
            int choice = sin.nextInt();
            switch (choice) {
                case 0 -> {
                    sin.close();
                    System.exit(0);
                }
                case 1 -> {
                    System.out.print("\n\nLado 1 do retangulo 1: ");
                    double side1 = UserInput.getPositiveNumber(sin);
                    System.out.print("Lado 2 do retangulo 1: ");
                    double side2 = UserInput.getPositiveNumber(sin);
                    Rectangle r1 = new Rectangle(side1, side2);
                    System.out.print("Lado 1 do retangulo 2: ");
                    side1 = UserInput.getPositiveNumber(sin);
                    System.out.print("Lado 2 do retangulo 2: ");
                    side2 = UserInput.getPositiveNumber(sin);
                    Rectangle r2 = new Rectangle(side1, side2);
                    System.out.println("Retangulo 1: " + r1);
                    System.out.println("Area do retangulo 1: " + r1.getArea());
                    System.out.println("Perimetro do retangulo 1: " + r1.getPerimeter());
                    System.out.println("Retangulo 2: " + r2);
                    System.out.println("Area do retangulo 2: " + r2.getArea());
                    System.out.println("Perimetro do retangulo 2: " + r2.getPerimeter());
                    System.out.println("Retangulo 1 e igual ao retangulo 2? " + r1.equals(r2) + "\n\n");
                }
                case 2 -> {
                    System.out.print("\n\n\nLado 1 do triangulo 1: ");
                    double side1 = UserInput.getPositiveNumber(sin);
                    System.out.print("Lado 2 do triangulo 1: ");
                    double side2 = UserInput.getPositiveNumber(sin);
                    System.out.print("Lado 3 do triangulo 1: ");
                    double side3 = UserInput.getPositiveNumber(sin);
                    Triangle t1 = new Triangle(side1, side2, side3);
                    System.out.print("Lado 1 do triangulo 2: ");
                    side1 = UserInput.getPositiveNumber(sin);
                    System.out.print("Lado 2 do triangulo 2: ");
                    side2 = UserInput.getPositiveNumber(sin);
                    System.out.print("Lado 3 do triangulo 2: ");
                    side3 = UserInput.getPositiveNumber(sin);
                    Triangle t2 = new Triangle(side1, side2, side3);
                    System.out.println("Triangulo 1: " + t1);
                    System.out.println("Area do triangulo 1: " + t1.getArea());
                    System.out.println("Perimetro do triangulo 1: " + t1.getPerimeter());
                    System.out.println("Triangulo 2: " + t2);
                    System.out.println("Area do triangulo 2: " + t2.getArea());
                    System.out.println("Perimetro do triangulo 2: " + t2.getPerimeter());
                    System.out.println("Triangulo 1 e igual ao triangulo 2? " + t1.equals(t2) + "\n\n");
                }
                case 3 -> {
                    System.out.print("Raio do circulo 1: ");
                    double radius = UserInput.getPositiveNumber(sin);
                    Circle c1 = new Circle(radius);
                    System.out.print("Raio do circulo 2: ");
                    radius = UserInput.getPositiveNumber(sin);
                    Circle c2 = new Circle(radius);
                    System.out.println("Circulo 1: " + c1);
                    System.out.println("Area do circulo 1: " + c1.getArea());
                    System.out.println("Perimetro do circulo 1: " + c1.getPerimeter());
                    System.out.println("Circulo 2: " + c2);
                    System.out.println("Area do circulo 2: " + c2.getArea());
                    System.out.println("Perimetro do circulo 2: " + c2.getPerimeter());
                    System.out.println("Circulo 1 e igual ao circulo 2? " + c1.equals(c2) + "\n\n");
                }
                default -> System.out.println("Opção inválida.");
            }
        }
    }
}
