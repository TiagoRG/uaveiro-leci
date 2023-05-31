package aula11.ex3;

import utils.MathTools;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.LinkedList;

public class EnergyUsageReport {
    private final LinkedList<Customer> customers = new LinkedList<Customer>();

    public void load(String file) {
        LinkedList<String> lines = new LinkedList<>();
        Path path = Paths.get(file);
        try {
            lines = new LinkedList<>(Files.readAllLines(path));
        } catch (IOException e) {
            System.out.printf("Certifique-se que o ficheiro \"%s\" está na raiz da pasta do projeto", path);
            System.exit(1);
        }

        for (String line : lines) {
            String[] data = line.split("\\|");
            int customerId = Integer.parseInt(data[0]);
            LinkedList<Double> meterReadings = new LinkedList<>(Arrays.stream(data).toList().subList(1, data.length).stream().map(Double::parseDouble).toList());
            customers.add(new Customer(customerId, meterReadings));
        }
    }

    public void addCustomer(Customer newCustomer) {
        customers.add(newCustomer);
    }

    public void removeCustomer(int id) {
        customers.removeIf(customer -> customer.getCustomerId() == id);
    }

    public Customer getCustomer(int id) {
        return customers.stream().filter(customer -> customer.getCustomerId() == id).findFirst().orElse(null);
    }

    public double calculateTotalUsage(int id) {
        return MathTools.sum(getCustomer(id).getMeterReadings());
    }

    public void generateReport(String path) throws IOException {
        for (Customer customer : customers) {
            Files.writeString(Path.of(path), String.format("Customer ID: %d%nTotal usage: %.1f%n%n", customer.getCustomerId(), calculateTotalUsage(customer.getCustomerId())), (new File(path)).exists() ? java.nio.file.StandardOpenOption.APPEND : java.nio.file.StandardOpenOption.CREATE);
        }
    }
}
