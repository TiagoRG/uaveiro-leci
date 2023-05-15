package aula12.ex3;

import utils.UserInput;

import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.*;

public class Main {
    public static void main(String[] args) throws IOException {
        List<Movie> movies = new ArrayList<>();
        TreeSet<String> titles = new TreeSet<>();

        List<Movie> unsortedMovies = new ArrayList<>();
        Scanner reader = new Scanner(new FileReader("datafiles/aula12/movies.txt"));
        reader.nextLine();
        while (reader.hasNextLine()) {
            String[] line = reader.nextLine().split("\t");
            Movie movie = new Movie(line[0], Double.parseDouble(line[1]), line[2], line[3], Integer.parseInt(line[4]));
            unsortedMovies.add(movie);
            titles.add(movie.title().toLowerCase());
        }


        for (String title : titles)
            movies.add(unsortedMovies.stream().filter(movie -> movie.title().equalsIgnoreCase(title)).findFirst().get());

        System.out.println(movies);
        System.out.println("\n\n\n");

        System.out.println(movies.stream().sorted(Comparator.comparing(Movie::score).reversed()).toList());
        System.out.println("\n\n\n");

        System.out.println(movies.stream().sorted(Comparator.comparing(Movie::duration)).toList());
        System.out.println("\n\n\n");

        TreeMap<String, Integer> genres = new TreeMap<>();
        movies.forEach(movie -> genres.put(movie.genre(), genres.getOrDefault(movie.genre(), 0) + 1));

        System.out.println(genres);
        System.out.println("\n\n\n");

        String genre = UserInput.input(new Scanner(System.in), "Genre: ");
        movies.stream().filter(movie -> movie.genre().equalsIgnoreCase(genre) && movie.score() > 60).forEach(movie -> {
            try {
                Files.writeString(Path.of("datafiles/aula12/myselection.txt"), movie.toString());
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
    }
}
