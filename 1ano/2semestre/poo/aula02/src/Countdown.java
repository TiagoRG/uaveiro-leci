import java.util.Scanner;

// Solução do exercício 9

public class Countdown {
    public static void main(String[] args){
        Scanner sin = new Scanner(System.in);

        System.out.print("N? ");
        int n = sin.nextInt();
        for (int i = n; i >= 0; i--) {
            System.out.print(i%10 == 0 ? i + "\n" : i + ",");
        }
    }
}