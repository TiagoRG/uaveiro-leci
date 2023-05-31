package aula07.ex1;

public abstract class Shape {
    protected String color;

    public abstract boolean equals(Shape c2);

    public abstract String toString();

    public abstract double getArea();

    public abstract double getPerimeter();
}
