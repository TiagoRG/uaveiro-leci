package aula08.ex3.Interfaces;

import aula08.ex3.Product;

public interface IPurchase {
    void addProduct(Product product, int amount);

    void listProducts();

    double getTotal();
}
