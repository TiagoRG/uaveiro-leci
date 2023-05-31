package aula08.ex3;

public class ShoppingCartTester {
    public static void main(String[] args) {
        Product p1 = new Product("Camisolas", 10, 3);
        Product p2 = new Product("Calças", 30, 1);
        Product p3 = new ProductWithDiscount("Sapatilhas", 50, 2, 50);
        Product p4 = new ProductWithDiscount("Casacos", 100, 1, 10);

        Purchase compra = new Purchase();
        compra.addProduct(p2, 5);
        compra.addProduct(p3, 2);
        compra.addProduct(p4, 1);
        compra.addProduct(p1, 1);

        compra.listProducts();
        System.out.printf("Preço total da compra %.2f\n", compra.getTotal());
    }
}
