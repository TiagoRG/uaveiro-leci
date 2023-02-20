package tp_codecheck.tp01;

// Solução do exercício 3

public class Table {

   public static void main(String[] args) {
      System.out.printf("%s | %s | %s | %s\n", "n", "Hn", "log n", "Hn - log n");
      int n = 1;
      while (n <= 1000000) {
         double f1 = harmonic(n);
         double f2 = Math.log((double)n);
         System.out.printf("%d | %.3f | %.3f | %.9f\n", n, f1, f2, f1-f2);
         n *= 2;
      }
   }

   /**
    * Computes the Harmonic number Hn = 1 + 1/2 + 1/3 + ... + 1/n.
    */
   private static double harmonic(int n) {
      double sum = 0;
      for (int i = 1; i <= n; i++) {
         sum += 1/(float)i;
      }
      return sum;
   }
}
