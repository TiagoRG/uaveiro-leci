package utils;

import java.util.List;
import java.util.Random;

public class MathTools {
    public static double round(double n, int places) {
        return (Math.round(n * Math.pow(10, places))) / Math.pow(10, places);
    }

    public static double random(double minLimit, double maxLimit) {
        Random rand = new Random();
        return rand.nextDouble(minLimit, maxLimit);
    }

    public static boolean isNumPrime(int n) {
        if (n <= 1)
            return false;
        for (int i = 2; i < n; i++)
            if (n % i == 0)
                return false;
        return true;
    }

    public static double sum(List<Double> list) {
        double sum = 0;
        for (double n : list)
            sum += n;
        return sum;
    }

    public static double media(List<Double> list) {
        return sum(list) / list.size();
    }
}
