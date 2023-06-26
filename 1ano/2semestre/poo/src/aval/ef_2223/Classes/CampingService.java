package aval.ef_2223.Classes;

import aval.ef_2223.Classes.CampingSpaces.CampingSpace;
import aval.ef_2223.Enums.ClientType;
import aval.ef_2223.Enums.SpaceType;
import aval.ef_2223.Interfaces.CampingServiceInterface;

import java.time.LocalDate;
import java.util.*;

public class CampingService implements CampingServiceInterface {
    private final List<CampingSpace> campingSpaces = new ArrayList<>();
    private final List<Client> clients = new ArrayList<>();
    private final Map<Client, List<Booking>> bookings = new HashMap<>();
    private String name;
    private String address;

    public CampingService(String name, String address) {
        this.name = name;
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public boolean registerClient(int taxId, String name, ClientType type) {
        try {
            clients.add(new Client(taxId, name, type));
            return true;
        } catch (Exception ignored) {
            return false;
        }
    }

    @Override
    public Client getClient(int taxId) {
        return clients.stream().filter(client -> client.getTaxId() == taxId).findFirst().orElse(null);
    }

    @Override
    public void addCampingSpace(CampingSpace campingSpace) {
        campingSpaces.add(campingSpace);
    }

    @Override
    public void addCampingSpaces(Collection<CampingSpace> campingSpaces) {
        this.campingSpaces.addAll(campingSpaces);
    }

    @Override
    public boolean checkAvailable(CampingSpace campingSpace, LocalDate startDate, LocalDate endDate) {
        if (campingSpace == null || startDate == null || endDate == null) return false;
        if (startDate.isAfter(endDate)) return false;
        if (!campingSpaces.contains(campingSpace)) return false;
        for (Map.Entry<Client, List<Booking>> bookingList : bookings.entrySet()) {
            for (Booking booking : bookingList.getValue())
                if (booking.getCampingSpace().equals(campingSpace))
                    return !(startDate.isBefore(booking.getEndDate()) && endDate.isAfter(booking.getStartDate()));
        }
        return true;
    }

    @Override
    public List<CampingSpace> findAvailableCampingSpaces(SpaceType spaceType, LocalDate fromDate, int duration, int[] minDimensions) {
        List<CampingSpace> availableCampingSpaces = new ArrayList<>();

        for (CampingSpace campingSpace : campingSpaces)
            if (checkAvailable(campingSpace, fromDate, fromDate.plusDays(duration)) && campingSpace.getSizes()[0] >= minDimensions[0] && campingSpace.getSizes()[1] >= minDimensions[1])
                availableCampingSpaces.add(campingSpace);
        return availableCampingSpaces;
    }

    @Override
    public boolean bookCampingSpace(Client client, CampingSpace campingSpace, LocalDate startDate, int duration) {
        if (client == null || campingSpace == null || startDate == null) return false;
        if (duration < 1) return false;
        if (!clients.contains(client)) return false;
        if (!campingSpaces.contains(campingSpace)) return false;
        if (client.getClientType() == ClientType.NORMAL && campingSpace.getType() == SpaceType.CARAVAN) return false;
        if (duration > (campingSpace.getType() == SpaceType.CARAVAN ? 3 * 365 : (campingSpace.getType() == SpaceType.CAR ? 3 * 30 : 15)))
            return false;
        if (!checkAvailable(campingSpace, startDate, startDate.plusDays(duration))) return false;
        bookings.putIfAbsent(client, new ArrayList<>());
        bookings.get(client).add(new Booking(campingSpace, startDate, startDate.plusDays(duration)));
        return true;
    }

    @Override
    public double calculateTotalCost(CampingSpace campingSpace, int duration) {
        return campingSpace.getPricePerNight() * duration;
    }

    @Override
    public List<String> listBookings() {
        List<String> bookingsList = new ArrayList<>();
        for (Map.Entry<Client, List<Booking>> bookingList : bookings.entrySet()) {
            for (Booking booking : bookingList.getValue())
                bookingsList.add(String.format("%s - [%s - %s] %s space located in %s, with dimension %dx%d, %.2f/day, total cost %.2f%n",
                        bookingList.getKey().toString(),
                        booking.getStartDate().toString(),
                        booking.getEndDate().toString(),
                        booking.getCampingSpace().getType().toString(),
                        booking.getCampingSpace().getLocation(),
                        booking.getCampingSpace().getSizes()[0],
                        booking.getCampingSpace().getSizes()[1],
                        booking.getCampingSpace().getPricePerNight(),
                        calculateTotalCost(booking.getCampingSpace(), (booking.getStartDate().until(booking.getEndDate()).getDays() + 1) * (booking.getStartDate().until(booking.getEndDate()).getMonths() + 1) * (booking.getStartDate().until(booking.getEndDate()).getYears() + 1))));
        }
        return bookingsList;
    }

    @Override
    public List<String> listBookings(SpaceType spaceType) {
        List<String> bookingsList = new ArrayList<>();
        for (Map.Entry<Client, List<Booking>> bookingList : bookings.entrySet()) {
            for (Booking booking : bookingList.getValue())
                if (booking.getCampingSpace().getType() == spaceType)
                    bookingsList.add(booking.toString());
        }
        return bookingsList;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof CampingService that)) return false;
        return Objects.equals(getName(), that.getName()) && Objects.equals(getAddress(), that.getAddress());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getName(), getAddress());
    }

    public List<CampingSpace> getAvailableSpacesByTotalArea(LocalDate localDate, int area) {
        List<CampingSpace> availableSpaces = new ArrayList<>();
        for (CampingSpace campingSpace : campingSpaces)
            if (campingSpace.getSizes()[0] * campingSpace.getSizes()[1] >= area)
                if (checkAvailable(campingSpace, localDate, localDate.plusDays(60)))
                    availableSpaces.add(campingSpace);
        return availableSpaces;
    }

    @Override
    public String toString() {
        return getName() + ", " + getAddress();
    }
}
