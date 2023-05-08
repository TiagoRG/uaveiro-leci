package aula11.ex2;

import java.util.LinkedList;

public class Student {

    private String name;
    private LinkedList<Double> grades;

    public Student(String name, LinkedList<Double> grades) {
        this.name = name;
        this.grades = grades;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LinkedList<Double> getGrades() {
        return grades;
    }

    public void setGrades(LinkedList<Double> grades) {
        this.grades = grades;
    }
}
