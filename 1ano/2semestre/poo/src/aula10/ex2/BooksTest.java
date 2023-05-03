package aula10.ex2;

import aula10.ex1.Book;

import java.util.HashMap;
import java.util.LinkedList;

public class BooksTest {
    static HashMap<String, LinkedList<Book>> books = new HashMap<>() {
        @Override
        public String toString() {
            StringBuilder sb = new StringBuilder();
            for (String genre : this.keySet()) {
                sb.append(genre).append(":");
                for (Book book : this.get(genre)) {
                    sb.append("\n\t").append(book);
                }
                sb.append("\n");
            }
            return sb.toString();
        }
    };

    public static void main(String[] args) {
        books.put("Fantasia", new LinkedList<>());
        books.put("Ficção Científica", new LinkedList<>());
        books.put("Romance", new LinkedList<>());
        books.put("Terror", new LinkedList<>());
        books.get("Fantasia").add(new Book("Harry Potter", "J. K. Rowling", 1997));
        books.get("Ficção Científica").add(new Book("The Martian", "Andy Weir", 2011));
        books.get("Romance").add(new Book("Pride and Prejudice", "Jane Austen", 1813));
        books.get("Terror").add(new Book("The Shining", "Stephen King", 1977));
        books.get("Fantasia").add(new Book("The Hobbit", "J. R. R. Tolkien", 1937));
        books.get("Ficção Científica").add(new Book("The Hitchhiker's Guide to the Galaxy", "Douglas Adams", 1979));
        books.get("Romance").add(new Book("Jane Eyre", "Charlotte Brontë", 1847));
        books.get("Terror").add(new Book("Frankenstein", "Mary Shelley", 1818));
        System.out.println(books);
        System.out.print(selectRandomBook("Fantasia"));
    }

    public static Book selectRandomBook(String genre) {
        return books.get(genre).get((int) (Math.random() * books.get(genre).size()));
    }
}
