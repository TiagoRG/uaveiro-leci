package aula11.ex3;

import java.util.LinkedList;

public class Customer {
    private int customerId;
    private LinkedList<Double> meterReadings;

    public Customer(int customerId, LinkedList<Double> meterReadings) {
        this.customerId = customerId;
        this.meterReadings = meterReadings;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public LinkedList<Double> getMeterReadings() {
        return meterReadings;
    }

    public void setMeterReadings(LinkedList<Double> meterReadings) {
        this.meterReadings = meterReadings;
    }
}
