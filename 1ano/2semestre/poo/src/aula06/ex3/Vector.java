package aula06.ex3;

public class Vector {
    private int[] vector;

    // Constructors and main getter
    public Vector() {
        this.vector = new int[0];
    }

    public Vector(int size) {
        this.vector = new int[size];
    }

    public Vector(int[] vector) {
        this.vector = vector;
    }

    public int[] getVector() {
        return vector;
    }

    // Getters
    public int size() {
        return this.vector.length;
    }

    public boolean contains(int value) {
        for (int n : this.vector)
            if (n == value)
                return true;
        return false;
    }

    public int count(int value) {
        int count = 0;
        for (int n : this.vector)
            if (n == value)
                count++;
        return count;
    }

    // Method to change values
    public void insert(int value) {
        if (this.contains(value)) return;
        int[] aux = new int[this.size() + 1];
        System.arraycopy(this.vector, 0, aux, 0, this.size());
        aux[this.size()] = value;
        this.vector = aux;
    }

    public void remove(int value) {
        int[] aux = new int[this.size() - this.count(value)];
        int i = 0;
        for (int n : this.vector) {
            if (n == value)
                continue;
            aux[i] = n;
            i++;
        }
        this.vector = aux;
    }

    public void empty() {
        this.vector = new int[0];
    }

    // Interact with other vectors
    public Vector add(Vector secondVector) {
        Vector result = new Vector();
        for (int n : this.vector)
            if (!result.contains(n))
                result.insert(n);
        for (int n : secondVector.vector)
            if (!result.contains(n))
                result.insert(n);
        return result;
    }

    public Vector subtract(Vector secondVector) {
        Vector result = new Vector();
        for (int n : this.vector)
            if (!result.contains(n) && !secondVector.contains(n))
                result.insert(n);
        return result;
    }

    public Vector intersect(Vector secondVector) {
        Vector result = new Vector();
        for (int n : this.vector)
            if (!result.contains(n) && secondVector.contains(n))
                result.insert(n);
        return result;
    }

    // ToString
    @Override
    public String toString() {
        StringBuilder result = new StringBuilder();
        for (int n : this.vector)
            result.append(String.format("%d ", n));
        return this.size() > 0 ? result.substring(0, result.length() - 1) : result.toString();
    }
}
