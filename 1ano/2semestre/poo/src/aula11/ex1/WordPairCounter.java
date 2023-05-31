package aula11.ex1;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Scanner;
import java.util.TreeMap;

public class WordPairCounter {
    public static void main(String[] args) {
        TreeMap<String, HashMap<String, Integer>> wordPairs = new TreeMap<>();

        String text = "";
        Path path = Paths.get((new Scanner(System.in)).nextLine());
        try {
            text = Files.readString(path);
        } catch (IOException e) {
            System.out.printf("Certifique-se que o ficheiro \"%s\" está na raiz da pasta do projeto", path);
            System.exit(1);
        }
        Object[] words = Arrays.stream(text.split("[\\s.,:'‘’;?!\\-*{}=+&/()\\[\\]”“\"]+")).filter(word -> word.length() > 2).map(String::toLowerCase).toArray();

        for (int i = 1; i < words.length - 1; i++) {
            String word1 = (String) words[i - 1];
            String word2 = (String) words[i];

            HashMap<String, Integer> word1Pair = wordPairs.getOrDefault(word1, new HashMap<>());
            wordPairs.put(word1, word1Pair);
            word1Pair.put(word2, word1Pair.getOrDefault(word2, 0) + 1);
        }

        wordPairs.entrySet().forEach(System.out::println);
    }
}
