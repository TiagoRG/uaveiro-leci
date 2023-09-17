
/*
Crie um programa em C equivalente a este em Java.
*/

public class ProgA {
    
    public static void main(String[] args) {
        int[] a = {31,28,31,30,31,30,31,31,30,31,30,31};
        printArray("a", a);

        int[] b = new int[12];
        cumSum(a, b);
        printArray("b", b);
    }

    public static void printArray(String s, int[] a) {
        System.out.println(s + ":");
        for (int i=0; i<a.length; i++) {
            System.out.print(a[i]+" ");
        }
        System.out.println();
    }

    public static void cumSum(int[] a, int[] b) {
        int c = 0;
        for (int i=0; i<a.length; i++) {
            c += a[i];
            b[i] = c;
        }
    }
}

