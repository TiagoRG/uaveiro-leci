package aval.atp1;

import java.io.FileReader;
import java.io.IOError;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.Month;
import java.util.*;
// YOU MAY ADD IMPORTS HERE

public class RainfallTest {
    public static List<RainfallInfo> loadData(String filePath) {
        List<RainfallInfo> data = null;
        try {
            // Check if file is csv
            if (!filePath.endsWith(".csv")) {
                return null;
            }

            if (!Files.exists(Paths.get(filePath))) {
                return null;
            }

            // 1) Read the file and add RainfallInfo objects to a list.
            Scanner sc = new Scanner(new FileReader(filePath));
            sc.nextLine(); // skip header

            while (sc.hasNextLine()) {
                String[] datacomps = sc.nextLine().split(",");
                LocalDate date = LocalDate.parse(datacomps[0]);
                String location = datacomps[1];
                double rainfall = Double.parseDouble(datacomps[2]);
                if (data == null) data = new ArrayList<>();
                data.add(new RainfallInfo(date, location, rainfall));
            }
        } catch (Exception e) {
            throw new IOError(e.getCause()); // repackage as error
        }
        return data;
    }

    public static String printLocationData(List<RainfallInfo> data, String loc) {
        System.out.printf("Rainfall for location %s:\n", loc);
        // 2) Print rainfall values for the given location
        data.stream().filter(r -> r.location().equals(loc)).forEach(System.out::println);
        return "";
    }

    public static Map<Month, Double> totalPerMonth(List<RainfallInfo> data) {
        // 3) Calculate and return a map with the total rainfall per month
        Map<Month, Double> map = new HashMap<>();
        data.forEach(r -> {
            Month m = r.date().getMonth();
            if (map.containsKey(m)) {
                map.put(m, map.get(m) + r.rainfall());
            } else {
                map.put(m, r.rainfall());
            }
        });
        return map;
    }

    public static String printMapSorted(Map<Month, Double> map) {
        // 4) Print map sorted by key
        map.entrySet().stream().sorted(Map.Entry.comparingByKey()).forEach(e -> System.out.printf("%s: %.1f\n", e.getKey(), e.getValue()));
        return "";
    }

    // YOU MAY ADD METHODS HERE
    public static String main() {
        Test.lst = null;
        Test.map = null;
        // Load the file data to the list
        List<RainfallInfo> rainfallData = loadData("rainfall_data.csv");
        System.out.printf("Data size: %d\n", rainfallData.size());
        System.out.printf("Data hash: %d\n", rainfallData.hashCode());
        System.out.println();

        // Show data for a single town
        printLocationData(rainfallData, "Braga");
        System.out.println();

        // Find total rainfall per month
        Map<Month, Double> rainfallPerMonth = totalPerMonth(rainfallData);

        // Print sorted results
        printMapSorted(rainfallPerMonth);
        return "";
    }

    public static void main(String[] args) {
        main();
    }
}

class Test {
    static List<RainfallInfo> lst = new ArrayList<>();
    static Map<Month, Double> map = new HashMap<>();
    // Variables used in unit tests (DON'T USE IN YOUR IMPLEMENTATION!):
    private static final LocalDate[] dates = {
            LocalDate.parse("2023-03-02"),
            LocalDate.parse("2023-04-17"),
            LocalDate.parse("2023-05-27"),
    };

    static {
        lst.add(new RainfallInfo(dates[2], "Aveiro", 2.2));
        lst.add(new RainfallInfo(dates[1], "Braga", 3.0));
        lst.add(new RainfallInfo(dates[0], "Aveiro", 0.0));
        lst.add(new RainfallInfo(dates[2], "Braga", 4.0));
        lst.add(new RainfallInfo(dates[1], "Aveiro", 1.1));
        map.put(Month.JULY, 7.7);
        map.put(Month.MAY, 5.5);
        map.put(Month.JUNE, 6.6);
        map.put(Month.MARCH, 3.3);
    }
}