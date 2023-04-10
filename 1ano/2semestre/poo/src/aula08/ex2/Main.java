package aula08.ex2;

import java.util.LinkedList;
import java.util.Scanner;

public class Main {
    private static final Scanner sin = new Scanner(System.in);
    private static LinkedList<Menu> Menus;

    public static void main(String[] args) {
        while (true) {
            System.out.print("Choose an option:\n1 - Create menu\n2 - List menus\n0 - Exit\n\n>> ");
            int option = Integer.parseInt(sin.nextLine());
            switch (option) {
                case 0 -> {
                    sin.close();
                    System.exit(0);
                }
                case 1 -> Menus.add(new Menu(sin));
                case 2 -> {
                    for (Menu menu : Menus)
                        System.out.println(menu);
                }
            }
        }
    }
}
