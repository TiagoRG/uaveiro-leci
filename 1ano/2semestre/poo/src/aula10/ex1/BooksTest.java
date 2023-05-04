package aula10.ex1;

import java.util.HashMap;

public class BooksTest {
    static HashMap<String, Book> books = new HashMap<>() {
        @Override
        public String toString() {
            StringBuilder sb = new StringBuilder();
            for (String genre : this.keySet()) {
                sb.append(genre).append(" : ").append(this.get(genre)).append("\n");
            }
            return sb.toString();
        }
    };

    public static void main(String[] args) {
        books.put("Fantasia", new Book("Harry Potter", "J. K. Rowling", 1997));
        books.put("Ficção Científica", new Book("The Martian", "Andy Weir", 2011));
        books.put("Romance", new Book("Pride and Prejudice", "Jane Austen", 1813));
        books.put("Terror", new Book("The Shining", "Stephen King", 1977));
        System.out.println(books);
        for (String genre : books.keySet()) {
            System.out.println(genre);
        }
        for (Book book : books.values()) {
            System.out.println(book);
        }
    }
}
