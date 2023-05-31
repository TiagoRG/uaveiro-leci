package aula12.ex2;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.Scanner;
import java.util.TreeMap;

public class WordCounterByInitial {
    public static void main(String[] args) throws IOException {
        TreeMap<Character, TreeMap<String, Integer>> words = new TreeMap<>() {
            @Override
            public String toString() {
                StringBuilder sb = new StringBuilder();
                for (Character initial : this.keySet()) {
                    sb.append(initial).append(": ");
                    for (String word : this.get(initial).keySet())
                        sb.append(word).append(", ").append(this.get(initial).get(word)).append("; ");
                    sb.append("\b\n");
                }
                return sb.toString();
            }
        };

        Arrays.stream(Files.readString(Path.of((new Scanner(System.in)).nextLine()))
                        .split("[\\s.,:'‘’;?!\\-*{}=+&/()\\[\\]”“\"]+"))
                .filter(word -> word.length() > 2)
                .map(String::toLowerCase)
                .forEach(word -> {
                    char initial = word.charAt(0);
                    words.putIfAbsent(initial, new TreeMap<>());
                    TreeMap<String, Integer> initialWords = words.get(initial);
                    initialWords.put(word, initialWords.getOrDefault(word, 0) + 1);
                });

        System.out.println(words);
    }
}
