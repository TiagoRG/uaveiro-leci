package aula08.ex3;

import aula08.ex3.Interfaces.IPurchase;

import java.util.LinkedHashMap;

public class Purchase implements IPurchase {
    private final LinkedHashMap<Product, Integer> products = new LinkedHashMap<>();

    @Override
    public void addProduct(Product product, int amount) {
        if (product.stock() < amount)
            amount = product.stock();
        product.removeStock(amount);
        if (products.containsKey(product)) {
            int currentAmount = products.get(product);
            products.replace(product, currentAmount + amount);
        } else
            products.put(product, amount);
    }

    @Override
    public void listProducts() {
        for (Product product : products.keySet()) {
            int productAmount = products.get(product);
            System.out.printf("Product: %s\n\tAmount: %d\n\tPrice: %.2f\n", product.getName(), productAmount, productAmount * product.getPrice());
        }
    }

    @Override
    public double getTotal() {
        double total = 0;
        for (Product product : products.keySet())
            total += product.getPrice() * products.get(product);
        return total;
    }
}
