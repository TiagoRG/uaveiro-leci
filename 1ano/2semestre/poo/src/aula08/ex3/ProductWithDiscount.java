package aula08.ex3;

public class ProductWithDiscount extends Product {
    private double discountPercentage;

    public ProductWithDiscount(String name, double price, int stock, double discountPercentage) {
        super(name, price, stock);
        this.discountPercentage = discountPercentage;
    }

    public double getDiscountPercentage() {
        return this.discountPercentage;
    }

    public void setDiscountPercentage(double discountPercentage) {
        this.discountPercentage = discountPercentage;
    }

    @Override
    public double getPrice() {
        return super.getPrice() * (1 - discountPercentage / 100);
    }
}
