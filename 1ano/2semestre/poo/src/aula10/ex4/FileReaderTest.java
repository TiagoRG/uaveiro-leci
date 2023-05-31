package aula10.ex4;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.LinkedList;
import java.util.Scanner;

public class FileReaderTest {
    public static void main(String[] args) {
        LinkedList<String> words = new LinkedList<>();
        Scanner input;
        try {
            input = new Scanner(new FileReader("src/aula10/ex4/words.txt"));
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }
        while (input.hasNext()) {
            String word = input.next();
            if (word.length() > 2) {
                words.add(word);
            }
            System.out.println(word);
        }
        for (String word : words)
            if (word.endsWith("s"))
                System.out.println(word);
        words.removeIf(word -> !word.matches("^[a-zA-Záàãâéẽêíóõôúç]+$"));
    }
}
