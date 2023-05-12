package aula11.ex2;

import java.util.LinkedList;

public class SimpleGradeCalculator implements IGradeCalculator {
    @Override
    public double calculate(LinkedList<Double> grades) {
        double sum = 0;
        for (double n : grades)
            sum += n;
        return sum / grades.size();
    }
}
