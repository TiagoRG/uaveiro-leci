package aula04;

class Product {
    private final String name;
    private final double price;
    private final int quantity;

    public Product(String name, double price, int quantity) {
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }

    public double getTotalValue() {
        return price * quantity;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }
}


class CashRegister {

    // TODO: completar implementação da classe
    private final Product[] products = new Product[5];

    public void addProduct(Product p) {
        for (int i = 0; i < products.length; i++) {
            if (products[i] == null) {
                products[i] = p;
                break;
            }
        }
    }

    public double getTotalValue() {
        double total = 0;
        for (Product product : products) {
            if (product != null) {
                total += product.getTotalValue();
            }
        }
        return total;
    }

    public String toString() {
        String result = String.format("%-15s %10s %10s %7s\n", "Product", "Price", "Quantity", "Total");
        for (Product product : products) {
            if (product != null) {
                result += String.format("%-15s %10.2f %10d %7.2f\n", product.getName(), product.getPrice(), product.getQuantity(), product.getTotalValue());
            }
        }
        result += String.format("%s %.2f\n", "Total value: ", getTotalValue());
        return result;
    }

}

public class CashRegisterDemo {

    public static void main(String[] args) {

        // Cria e adiciona 5 produtos
        CashRegister cr = new CashRegister();
        cr.addProduct(new Product("Book", 9.99, 3));
        cr.addProduct(new Product("Pen", 1.99, 10));
        cr.addProduct(new Product("Headphones", 29.99, 2));
        cr.addProduct(new Product("Notebook", 19.99, 5));
        cr.addProduct(new Product("Phone case", 5.99, 1));

        // TODO: Listar o conteúdo e valor total
        System.out.println(cr);

    }
}