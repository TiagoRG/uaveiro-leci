package aula08.ex3.Interfaces;

public interface IProduct {
    String getName();
    void setPrice(double price);
    double getPrice();
    int stock();
    void addStock(int amount);
    void removeStock(int amount);
}
