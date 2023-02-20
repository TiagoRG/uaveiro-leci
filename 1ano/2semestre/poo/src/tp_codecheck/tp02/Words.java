package tp_codecheck.tp02;

import java.util.Scanner;

public class Words {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        String word = in.next();
        word = word.charAt(word.length()-1) + word.substring(1, word.length()-1) + word.charAt(0);
        System.out.println(word);
    }
}
