package aval.aa2.Classes;

import aval.aa2.Interfaces.OrderCostCalculator;

public class StandardOrderCostCalculator implements OrderCostCalculator {
    @Override
    public double calculateOrderCost(Order order) {
        double cost = 0;
        for (Item item : order.getItems()) {
            cost += item.price();
        }
        return order.isExpressOrder() ? cost * 1.3 : cost;
    }
}
