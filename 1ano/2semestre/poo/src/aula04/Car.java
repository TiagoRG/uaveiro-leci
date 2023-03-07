package aula04;

class Car {
    public String make;
    public String model;
    public int year;
    public int kms;

    public Car(String make, String model, int year, int kms) {
        this.make = make;
        this.model = model;
        this.year = year;
        this.kms = kms;
    }

    public void drive(int distance) {
        //TODO: acumular distância percorrida
        this.kms += distance;
    }

    public String toString() {
        return String.format("%s %s, %d, kms: %d", this.make, this.model, this.year, this.kms);
    }

}
