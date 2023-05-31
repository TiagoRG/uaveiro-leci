package aval.aa1;

import java.util.Scanner;

public class PetShelter implements IPetShelter {
    private final String shelterName;
    private Animal[] animals;

    public PetShelter(String shelterName) {
        this.shelterName = shelterName;
    }

    @Override
    public void addAnimal(Animal animal) {
        if (animals == null) {
            animals = new Animal[1];
            animals[0] = animal;
        } else {
            Animal[] newAnimals = new Animal[animals.length + 1];
            System.arraycopy(animals, 0, newAnimals, 0, animals.length);
            newAnimals[newAnimals.length - 1] = animal;
            animals = newAnimals;
        }
    }

    @Override
    public void removeAnimal(Animal animal) {
        Animal[] newAnimals = new Animal[animals.length - 1];
        int index = 0;
        for (Animal a : animals) {
            if (a.getId() != animal.getId()) {
                newAnimals[index] = a;
                index++;
            }
        }
        animals = newAnimals;
    }

    @Override
    public Animal searchForAnimal(String name) {
        for (Animal a : animals)
            if (a.getName().equals(name))
                return a;
        return null;
    }

    @Override
    public boolean sponsorAnimal(int animalId) {
        System.out.println("Sponsoring animal with id " + animalId + "...");
        System.out.print("Sponsor's name: ");
        String sponsorId = new Scanner(System.in).nextLine();
        for (Animal a : animals)
            if (a.getId() == animalId) {
                a.setSponsor(sponsorId);
                return true;
            }
        return false;
    }

    @Override
    public void listAllAnimals() {
        for (Animal a : animals)
            System.out.println(a.toString() + "\n");
    }
}
