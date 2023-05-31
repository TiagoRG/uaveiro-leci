package aula09.ex2;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

public class CollectionTester {
    public static void main(String[] args) {
        int DIM = 5000;
        Collection<Integer> col = new ArrayList<>();
        checkPerformance(col, DIM);
    }

    private static void checkPerformance(Collection<Integer> col, int DIM) {
        double start, stop, delta;
        // Add
        start = System.nanoTime(); // clock snapshot before
        for (int i = 0; i < DIM; i++)
            col.add(i);
        stop = System.nanoTime();  // clock snapshot after
        delta = (stop - start) / 1e6;  // convert to milliseconds
        System.out.println(col.size() + ": Add to " + col.getClass().getSimpleName() + " took " + delta + "ms");

        // Search
        start = System.nanoTime(); // clock snapshot before
        for (int i = 0; i < DIM; i++) {
            int n = (int) (Math.random() * DIM);
            if (!col.contains(n))
                System.out.println("Not found???" + n);
        }
        stop = System.nanoTime();  // clock snapshot after
        delta = (stop - start) / 1e6;  // convert nanoseconds to milliseconds
        System.out.println(col.size() + ": Search to " + col.getClass().getSimpleName() + " took " + delta + "ms");

        // Remove
        start = System.nanoTime(); // clock snapshot before
        Iterator<Integer> iterator = col.iterator();
        while (iterator.hasNext()) {
            iterator.next();
            iterator.remove();
        }
        stop = System.nanoTime();  // clock snapshot after
        delta = (stop - start) / 1e6;  // convert nanoseconds to milliseconds
        System.out.println(col.size() + ": Remove from " + col.getClass().getSimpleName() + " took " + delta + "ms");
    }
}
