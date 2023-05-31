package aula11.ex4;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.*;
import java.util.stream.Collectors;

public class FlightManager {
    private final LinkedList<Company> companies = new LinkedList<>();
    private final LinkedList<Flight> flights = new LinkedList<>();
    private String table;
    private String delaysTable;
    private String flightsNTable;

    private static Map<String, Integer> sortByValue(Map<String, Integer> unsortMap) {
        List<Map.Entry<String, Integer>> list = new LinkedList<>(unsortMap.entrySet());

        // Sorting the list based on values
        list.sort((o1, o2) -> o2.getValue().compareTo(o1.getValue()) == 0
                ? o2.getKey().compareTo(o1.getKey())
                : o2.getValue().compareTo(o1.getValue()));
        return list.stream().collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue, (a, b) -> b, LinkedHashMap::new));
    }

    public void loadCompanies(String filename) {
        Scanner input;
        try {
            input = new Scanner(new FileReader(filename));
            input.nextLine();
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }
        while (input.hasNext()) {
            String line = input.nextLine();
            String[] fields = line.split("\t");
            if (fields.length != 2)
                throw new RuntimeException("Invalid file format");
            this.companies.add(new Company(fields[0], fields[1], new LinkedList<>()));
        }
    }

    public void loadFlights(String filename) {
        Scanner input;
        try {
            input = new Scanner(new FileReader(filename));
            input.nextLine();
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }
        while (input.hasNext()) {
            String line = input.nextLine();
            String[] fields = line.split("\t");
            if (fields.length != 3 && fields.length != 4)
                throw new RuntimeException("Invalid file format");
            String[] timeStr = fields[0].split(":");
            Time time = new Time(Integer.parseInt(timeStr[0]), Integer.parseInt(timeStr[1]));
            String code = fields[1];
            Company company = this.companies.stream().filter(c -> c.code().equals(code.substring(0, 2))).findFirst().orElse(null);
            String origin = fields[2];
            String[] delayStr;
            try {
                delayStr = fields[3].split(":");
            } catch (IndexOutOfBoundsException e) {
                delayStr = new String[]{"0", "0"};
            }
            Time delay = new Time(Integer.parseInt(delayStr[0]), Integer.parseInt(delayStr[1]));
            Flight flight = new Flight(code, origin, time, delay, company);
            this.flights.add(flight);
            Objects.requireNonNull(company).flights().add(flight);
        }
    }

    public void buildTable() {
        StringBuilder table = new StringBuilder().append("Depart.   Flight    Company                  Origin                   Delay   Obs\n");
        for (Flight flight : flights)
            table.append(String.format("%-10s%-10s%-25s%-25s%-8s%s%n", flight.departure(), flight.code(), flight.company().name(), flight.origin(), flight.delay(), flight.delay().isZero() ? "" : "New departure: " + flight.departure().addTime(flight.delay())));
        this.table = table.toString();
    }

    public String getTable() {
        return table;
    }

    public void buildDelaysTable() {
        StringBuilder table = new StringBuilder().append("Company                  Avg. Delay\n");
        LinkedHashMap<String, Integer> delays = new LinkedHashMap<>();
        for (Company company : companies) {
            Time totalTime = new Time(0, 0);
            int nDelays = 0;
            for (Flight flight : company.flights()) {
                if (!flight.delay().isZero()) {
                    totalTime.addTime(flight.delay());
                    nDelays++;
                }
            }
            if (nDelays > 0)
                delays.put(company.name(), Time.timeToMinsInt(totalTime) / nDelays);
        }
        delays = (LinkedHashMap<String, Integer>) sortByValue(delays);
        for (String compName : delays.keySet())
            table.append(String.format("%-25s%s%n", compName, Time.minsIntToTime(delays.get(compName))));
        this.delaysTable = table.toString();
    }

    public String getDelaysTable() {
        return delaysTable;
    }

    public void buildFlightsNTable() {
        StringBuilder table = new StringBuilder().append("Origin                   n Flights\n");
        LinkedHashMap<String, Integer> flightsFromOrigin = new LinkedHashMap<>();
        for (Flight flight : flights)
            flightsFromOrigin.put(flight.origin(), flightsFromOrigin.getOrDefault(flight.origin(), 0) + 1);
        flightsFromOrigin = (LinkedHashMap<String, Integer>) sortByValue(flightsFromOrigin);
        for (String origin : flightsFromOrigin.keySet())
            table.append(String.format("%-25s%s%n", origin, flightsFromOrigin.get(origin)));
        this.flightsNTable = table.toString();
    }

    public String getFlightsNTable() {
        return flightsNTable;
    }

    public void storeTable(String filename) {
        Path path = Path.of(filename);
        try {
            Files.writeString(path, getTable());
        } catch (IOException e) {
            try {
                Files.createFile(path);
                storeTable(filename);
            } catch (IOException ex) {
                throw new RuntimeException(ex);
            }
        }
    }
}
