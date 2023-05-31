package aval.aa2.Classes;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

public class Order {
    public static int currentId = 0;
    private final int id;
    private final List<Item> items;
    private final String storeId;
    private final String clientId;
    private final LocalDateTime orderDateTime;
    private final boolean expressOrder;

    private double price;

    public Order(List<Item> items, String storeId, String clientId, LocalDateTime orderDateTime, boolean expressOrder) {
        this.id = ++currentId;
        this.items = items;
        this.storeId = storeId;
        this.clientId = clientId;
        this.orderDateTime = orderDateTime;
        this.expressOrder = expressOrder;
    }

    public int getId() {
        return id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public List<Item> getItems() {
        return items;
    }

    public String getStoreId() {
        return storeId;
    }

    public String getClientId() {
        return clientId;
    }

    public LocalDateTime getOrderDateTime() {
        return orderDateTime;
    }

    public boolean isExpressOrder() {
        return expressOrder;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Order order)) return false;
        return getId() == order.getId() && isExpressOrder() == order.isExpressOrder() && Double.compare(order.getPrice(), getPrice()) == 0 && Objects.equals(getItems(), order.getItems()) && Objects.equals(getStoreId(), order.getStoreId()) && Objects.equals(getClientId(), order.getClientId()) && Objects.equals(getOrderDateTime(), order.getOrderDateTime());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getItems(), getStoreId(), getClientId(), getOrderDateTime(), isExpressOrder(), getPrice());
    }

    @Override
    public String toString() {
        StringBuilder itemsStringBuilder = new StringBuilder();
        items.forEach(item -> itemsStringBuilder.append(item).append(", "));
        return String.format("Order #%d: Client ID: %s, Store ID: %s, Order Datetime: %s, Express order: %b, Total cost: %.2f, Items: {%s};",
                getId(), getClientId(), getStoreId(), getOrderDateTime().toString().replace('T', ' '), isExpressOrder(),
                getPrice(), itemsStringBuilder.substring(0, itemsStringBuilder.length() - 2));
    }
}
