package tp_codecheck.tp03.part2;

public class RentalCar {
    private boolean rented;
    private static int rentedCount = 0;
    private static int availableCount = 0;

    /**
     * Constructs a rental car.
     */
    public RentalCar() {
        // your work here
        rented = false;
        RentalCar.availableCount++;
    }

    /**
     * Get number of cars available.
     *
     * @return count of cars that are available
     */
    public static int numAvailable() {
        // your work here
        return RentalCar.availableCount;
    }

    /**
     * Get number of cars rented.
     *
     * @return count of cars that are rented
     */
    public static int numRented() {
        // your work here
        return RentalCar.rentedCount;
    }

    /**
     * Try to rent this car.
     *
     * @return true if the car was successfully rented, false if it was already
     * rented
     */
    public boolean rentCar() {
        // your work here
        if (this.rented) {
            return false;
        } else {
            this.rented = true;
            RentalCar.rentedCount++;
            RentalCar.availableCount--;
            return true;
        }
    }

    /**
     * Return rented car.
     *
     * @return true if the car was previously rented and is now returned,
     * false if it was not previously rented
     */
    public boolean returnCar() {
        // your work here
        if (this.rented) {
            this.rented = false;
            RentalCar.rentedCount--;
            RentalCar.availableCount++;
            return true;
        } else {
            return false;
        }
    }
}
