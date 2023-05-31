package aval.aa2;

import aval.aa2.Classes.Item;
import aval.aa2.Classes.Order;
import aval.aa2.Classes.OrderManager;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

public class OrderTester {
    public static void main(String[] args) {
        OrderManager orderManager = new OrderManager();

        orderManager.addOrder(new Order(new ArrayList<>(List.of(new Item[]{
                new Item("Chocolate", 2.43)
        })),
                "104", "23", LocalDateTime.of(2023, 5, 2, 14, 5), false));

        orderManager.addOrder(new Order(new ArrayList<>(List.of(new Item[]{
                new Item("Pastel de nata", 7.73),
                new Item("Sumo de laranja", 1.20)
        })),
                "114", "27", LocalDateTime.of(2023, 5, 6, 12, 4), true));

        orderManager.addOrder(new Order(new ArrayList<>(List.of(new Item[]{
                new Item("Galão", 1.20),
                new Item("Torrada", 1.00)
        })),
                "124", "1", LocalDateTime.of(2023, 5, 12, 7, 4), false));

        orderManager.printAllOrders();

        orderManager.removeOrder(3);

        orderManager.printAllOrders();

        try {
            loadOrdersFile(orderManager, "src/aval/aa2/pedidos.txt");
        } catch (FileNotFoundException e) {
            System.out.println("Couldn't find that file!");
        }

        System.out.println(orderManager.searchOrder(10));

        orderManager.printAllOrders();

        System.out.println(orderManager.calculateOrderCost(5));

        orderManager.calculateOrdersCostInMonth(5);

        orderManager.printAllOrders();

        saveToFile(orderManager, "src/aval/aa2/output.txt");
    }

    private static void loadOrdersFile(OrderManager orderManager, String filename) throws FileNotFoundException {
        Scanner sin = new Scanner(new FileReader(filename));
        if (!sin.hasNextLine()) return;

        sin.nextLine();
        while (sin.hasNextLine()) {
            try {
                String orderString = sin.nextLine();
                String[] orderData = orderString.split(";");
                String[] localDate = orderData[3].split(" ")[0].split("-");
                String[] localTime = orderData[3].split(" ")[1].split(":");
                LocalDateTime localDateTime = LocalDateTime.of(Integer.parseInt(localDate[0]), Integer.parseInt(localDate[1]), Integer.parseInt(localDate[2]), Integer.parseInt(localTime[0]), Integer.parseInt(localTime[1]));
                String[] itemsStrings = orderData[2].split("\\|");
                List<Item> items = new ArrayList<>();
                Arrays.stream(itemsStrings).toList().forEach(item -> items.add(new Item(item.split(":")[0], Double.parseDouble(item.split(":")[1]))));
                orderManager.addOrder(new Order(items, orderData[1], orderData[0], localDateTime, orderData[4].equals("express")));
            } catch (ArrayIndexOutOfBoundsException ignored) {
            }
        }
    }

    public static void saveToFile(OrderManager orderManager, String filename) {
        Path path = Path.of(filename);
        try {
            Files.writeString(path, orderManager.toString());
        } catch (IOException e) {
            try {
                Files.createFile(path);
                saveToFile(orderManager, filename);
            } catch (IOException ex) {
                throw new RuntimeException(ex);
            }
        }
    }
}
