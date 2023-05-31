package aval.aa1;

public interface IPetShelter {
    void addAnimal(Animal animal);

    void removeAnimal(Animal animal);

    Animal searchForAnimal(String name);

    boolean sponsorAnimal(int animalId);

    void listAllAnimals();
}
