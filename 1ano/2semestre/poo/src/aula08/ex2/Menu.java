package aula08.ex2;

import aula08.ex2.Aliments.*;
import aula08.ex2.Dishes.DietDish;
import aula08.ex2.Dishes.Dish;
import aula08.ex2.Dishes.VeganDish;
import aula08.ex2.Enums.AlimentType;
import aula08.ex2.Enums.DishType;
import aula08.ex2.Enums.FishState;
import aula08.ex2.Enums.MeatType;
import utils.Enums.Weekday;

import java.util.LinkedHashMap;
import java.util.Scanner;

public class Menu {
    private final Scanner sin;
    private final LinkedHashMap<Weekday, Dish> menu;

    public Menu(Scanner sin, LinkedHashMap<Weekday, Dish> menu) {
        this.sin = sin;
        this.menu = menu;
        while (true) {
            System.out.print("Choose an option:\n1 - Add dish\n2 - Remove dish\n3 - Print menu\n0 - Exit\n\n>> ");
            int option = Integer.parseInt(sin.nextLine());
            switch (option) {
                case 0 -> {
                    return;
                }
                case 1 -> {
                    System.out.print("What weekday do you want to add a dish to: ");
                    Weekday weekday = Weekday.fromString(sin.nextLine());
                    if (this.menu.containsKey(weekday))
                        System.out.print("That weekday already has a dish assigned to it.");
                    else
                        this.menu.put(weekday, this.dishBuilder());
                }
                case 2 -> {
                    System.out.print("What weekday dish do you want to remove: ");
                    Weekday weekday = Weekday.fromString(sin.nextLine());
                    try {
                        this.menu.remove(weekday);
                    } catch (Exception ignored) {
                        System.out.println("That weekday has no dish assigned to.");
                    }
                }
                case 3 -> System.out.println(this);
                default -> System.out.println("Invalid option.");
            }
        }
    }

    public Menu(Scanner sin) {
        this(sin, new LinkedHashMap<>());
    }

    public Menu() {
        this(new Scanner(System.in), new LinkedHashMap<>());
    }

    public Dish dishBuilder() {
        System.out.print("Dish name: ");
        String name = sin.nextLine();
        Dish dish;
        while (true) {
            System.out.print("Dish type? (NORMAL/VEGAN/DIET): ");
            DishType dishType = DishType.fromString(sin.nextLine());
            switch (dishType) {
                case NORMAL -> dish = new Dish(name);
                case VEGAN -> dish = new VeganDish(name);
                case DIET -> {
                    System.out.print("Calories limit: ");
                    double caloriesLimit = Double.parseDouble(sin.nextLine());
                    dish = new DietDish(name, caloriesLimit);
                }
                default -> {
                    System.out.print("Invalid option.");
                    continue;
                }
            }
            break;
        }
        while (true) {
            System.out.print("Choose an option:\n1 - Add aliment\n2 - Print dish\n0 - Finish dish\n\n>> ");
            int option = Integer.parseInt(sin.nextLine());
            switch (option) {
                case 0 -> {
                    return dish;
                }
                case 1 -> {
                    Aliment aliment = null;
                    System.out.print("Aliment calories: ");
                    double calories = Double.parseDouble(sin.nextLine());
                    System.out.print("Aliment proteins: ");
                    double proteins = Double.parseDouble(sin.nextLine());
                    System.out.print("Aliment weight: ");
                    double weight = Double.parseDouble(sin.nextLine());
                    System.out.print("What type of aliment are u adding? (MEAT/FISH/CEREAL/VEGETABLE): ");
                    AlimentType alimentType = AlimentType.fromString(sin.nextLine());
                    switch (alimentType) {
                        case MEAT -> {
                            System.out.print(alimentType + " type? (COW/PORK/TURKEY/CHICKEN): ");
                            MeatType meatType = MeatType.fromString(sin.nextLine());
                            aliment = new Meat(meatType, proteins, calories, weight);
                        }
                        case FISH -> {
                            System.out.print(alimentType + " state? (FRESH/FROZEN): ");
                            FishState fishState = FishState.fromString(sin.nextLine());
                            aliment = new Fish(fishState, proteins, calories, weight);
                        }
                        case CEREAL, VEGETABLE -> {
                            System.out.print(alimentType + " name: ");
                            String alimentName = sin.nextLine();
                            aliment = alimentType == AlimentType.CEREAL ? new Cereal(alimentName, proteins, calories, weight) : new Vegetable(alimentName, proteins, calories, weight);
                        }
                    }
                    dish.addAliment(aliment);
                }
                case 2 -> {
                    System.out.println(dish);
                    for (Aliment aliment : dish.getAliments())
                        System.out.println(aliment);
                }
                default -> System.out.println("Invalid option.");
            }
        }
    }

    @Override
    public String toString() {
        StringBuilder string = new StringBuilder("Menu");
        for (Weekday weekDay : this.menu.keySet())
            string.append(String.format("%s : %s", weekDay, menu.get(weekDay)));
        return string.toString();
    }
}
