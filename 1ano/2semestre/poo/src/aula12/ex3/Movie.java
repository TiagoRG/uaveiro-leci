package aula12.ex3;

public record Movie(String title, double score, String rating, String genre, int duration) {
    @Override
    public String toString() {
        return String.format("%s\n\tScore: %.1f\n\tRating: %s\n\tGenre: %s\n\tDuration: %d\n\n", title, score, rating, genre, duration);
    }
}
