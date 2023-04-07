package aval.aa1;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        IPetShelter shelter = new PetShelter("Patudos");

        int choice = 0;
        do {
            System.out.println("Choose an option:");
            System.out.println("1. Add animal");
            System.out.println("2. Remove animal");
            System.out.println("3. Search for animal");
            System.out.println("4. Sponsor an animal");
            System.out.println("5. View all animals");
            System.out.println("6. Exit");

            choice = Integer.parseInt(scanner.nextLine());

            switch (choice) {
                case 1:
                    // adicionar animal
                    System.out.println("Adding an animal.");
                    System.out.print("Animal type (Dog/Rabbit/Bird): ");
                    String newAnimalType = scanner.nextLine();
                    System.out.print("Animal name: ");
                    String newAnimalName = scanner.nextLine();
                    System.out.print("Animal age: ");
                    int newAnimalAge = Integer.parseInt(scanner.nextLine());
                    System.out.print("Animal weight: ");
                    int newAnimalWeight = Integer.parseInt(scanner.nextLine());
                    System.out.print("Animal sponsor: ");
                    String newAnimalSponsor = scanner.nextLine();
                    Animal newAnimal;
                    switch (newAnimalType) {
                        case "Dog":
                            System.out.print("Dog breed: ");
                            String breed = scanner.nextLine();
                            newAnimal = new Dog(newAnimalName, newAnimalWeight, newAnimalAge, breed, newAnimalSponsor);
                            shelter.addAnimal(newAnimal);
                            break;
                        case "Rabbit":
                            System.out.print("Rabbit fur size (small/large): ");
                            String fur = scanner.nextLine();
                            newAnimal = new Rabbit(newAnimalName, newAnimalWeight, newAnimalAge, fur, newAnimalSponsor);
                            shelter.addAnimal(newAnimal);
                            break;
                        case "Bird":
                            System.out.print("Bird habitat: ");
                            String habitat = scanner.nextLine();
                            newAnimal = new Bird(newAnimalName, newAnimalWeight, newAnimalAge, habitat, newAnimalSponsor);
                            shelter.addAnimal(newAnimal);
                            break;
                        default:
                            System.out.println("Invalid animal.");
                            break;
                    }
                    break;
                case 2:
                    // remover animal
                    System.out.print("Animal name: ");
                    String removedAnimalName = scanner.nextLine();
                    Animal removedAnimal = shelter.searchForAnimal(removedAnimalName);
                    if (removedAnimal != null) {
                        shelter.removeAnimal(removedAnimal);
                        System.out.println("Animal removed.");
                    } else {
                        System.out.println("Animal not found.");
                    }
                    break;
                case 3:
                    // procurar animal
                    System.out.print("Animal name:");
                    String searchAnimalName = scanner.nextLine();
                    System.out.println(shelter.searchForAnimal(searchAnimalName));
                    break;
                case 4:
                    // apadrinhar animal
                    System.out.print("Id of animal you want to sponsor: ");
                    int sponsorId = Integer.parseInt(scanner.nextLine());
                    if (shelter.sponsorAnimal(sponsorId))
                        System.out.println("Animal of id '" + sponsorId + "' was sponsored");
                    else
                        System.out.println("Couldn't sponsor animal with id: " + sponsorId);
                    break;
                case 5:
                    // imprimir a informação de todos os animais
                    shelter.listAllAnimals();
                    break;
                case 6:
                    System.out.println("Goodbye!");
                    break;
                default:
                    // imprimir mensagem de erro
                    System.out.println("Invalid option.");
                    break;
            }

        } while (choice != 6);
    }
}
