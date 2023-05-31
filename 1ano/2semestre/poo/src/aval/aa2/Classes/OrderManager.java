package aval.aa2.Classes;

import java.util.ArrayList;
import java.util.List;

public class OrderManager {
    List<Order> orders = new ArrayList<>();

    public void addOrder(Order order) {
        orders.add(order);
    }

    public void removeOrder(int id) {
        orders.removeIf(order -> order.getId() == id);
    }

    public Order searchOrder(int id) {
        return orders.stream().filter(order -> order.getId() == id).findFirst().orElse(null);
    }

    public double calculateOrderCost(int id) {
        StandardOrderCostCalculator calculator = new StandardOrderCostCalculator();
        double cost = searchOrder(id) != null ? calculator.calculateOrderCost(searchOrder(id)) : -1;
        searchOrder(id).setPrice(cost);
        return cost;
    }

    public void calculateOrdersCostInMonth(int month) {
        StandardOrderCostCalculator calculator = new StandardOrderCostCalculator();
        orders.stream().filter(order -> order.getOrderDateTime().getMonth().getValue() == month).forEach(order -> order.setPrice(calculator.calculateOrderCost(searchOrder(order.getId()))));
    }

    public void printAllOrders() {
        for (Order order : orders)
            System.out.println(order);
        System.out.println();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (Order order : orders)
            sb.append(order).append("\n");
        return sb.toString();
    }
}
