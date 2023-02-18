package utils;

public class MathTools {
    public static double round(double n, int places) {
        return (Math.round(n * Math.pow(10, places))) / Math.pow(10, places);
    }
}
