package aula12.ex1;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Scanner;

public class DifferentWordCounter {
    public static void main(String[] args) throws FileNotFoundException {
        Scanner reader = new Scanner(new FileReader((new Scanner(System.in)).nextLine()));
        List<String> words = new ArrayList<>();

        while (reader.hasNext()) words.add(reader.next());

        HashSet<String> differentWords = new HashSet<>(words);

        System.out.println("Number of words: " + words.size());
        System.out.println("Number of different words: " + differentWords.size());
    }
}
