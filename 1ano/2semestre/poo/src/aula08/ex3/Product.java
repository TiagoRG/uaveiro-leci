package aula08.ex3;

import aula08.ex3.Interfaces.IProduct;

public class Product implements IProduct {
    private final String name;
    private double price;
    private int stock = 0;

    public Product(String name, double price, int stock) {
        this.name = name;
        this.setPrice(price);
        this.addStock(stock);
    }

    @Override
    public String getName() {
        return this.name;
    }

    @Override
    public double getPrice() {
        return this.price;
    }

    @Override
    public void setPrice(double price) {
        if (price <= 0)
            throw new IllegalArgumentException("Price must be positive.");
        this.price = price;
    }

    @Override
    public int stock() {
        return this.stock;
    }

    @Override
    public void addStock(int amount) {
        this.stock += amount;
    }

    @Override
    public void removeStock(int amount) {
        this.stock -= amount;
    }

    @Override
    public String toString() {
        return String.format("Product: %s\n\tStock: %d\n\tPrice: %.2f\n", this.getName(), this.stock(), this.getPrice());
    }
}
