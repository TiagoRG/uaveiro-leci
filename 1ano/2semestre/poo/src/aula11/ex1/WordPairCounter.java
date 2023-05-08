package aula11.ex1;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

public class WordPairCounter {
    public static void main(String[] args) {
        TreeMap<String, HashMap<String, Integer>> wordPairs = new TreeMap<>() {
            @Override
            public String toString() {
                StringBuilder sb = new StringBuilder();
                for (String word1 : this.keySet()) {
                    sb.append(word1).append("={");
                    for (String word2 : this.get(word1).keySet()) {
                        sb.append(word2).append("=").append(this.get(word1).get(word2)).append(", ");
                    }
                    sb.delete(sb.length()-2, sb.length()).append("}\n");
                }
                return sb.toString();
            }
        };

        String text = "";
        Path path = Paths.get((new Scanner(System.in)).nextLine());
        try {
			text = Files.readString(path);
		} catch (IOException e) {
			System.out.printf("Certifique-se que o ficheiro \"%s\" está na raiz da pasta do projeto", path);
            System.exit(1);
		}
        String[] words = text.split("[\\s.,:'‘’;?!\\-*{}=+&/()\\[\\]”“\"]+");

        for (int i = 0; i < words.length; i++) {
            String word1 = words[i];
            if (word1.length() < 3) continue;
            word1 = word1.toLowerCase();

            String word2 = null;
            for (int j = i+1; j < words.length; j++)
                if (words[j].length() > 2) {
                    word2 = words[j];
                    break;
                }
            if (word2 == null) break;
            word2 = word2.toLowerCase();

            HashMap<String, Integer> word1Pair;
            if (wordPairs.containsKey(word1))
                word1Pair = wordPairs.get(word1);
            else {
                word1Pair = new HashMap<>();
                wordPairs.put(word1, word1Pair);
            }

            if (word1Pair.containsKey(word2))
                word1Pair.put(word2, word1Pair.get(word2) + 1);
            else
                word1Pair.put(word2, 1);
        }

        System.out.println(wordPairs);
    }
}
