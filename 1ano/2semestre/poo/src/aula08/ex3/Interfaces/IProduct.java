package aula08.ex3.Interfaces;

public interface IProduct {
    String getName();

    double getPrice();

    void setPrice(double price);

    int stock();

    void addStock(int amount);

    void removeStock(int amount);
}
