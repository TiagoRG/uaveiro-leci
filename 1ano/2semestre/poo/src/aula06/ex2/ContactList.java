package aula06.ex2;

import aula06.ex1.Person;
import utils.DateYMD;

import java.util.Scanner;

public class ContactList {
    private static final Scanner sin = new Scanner(System.in);
    private static Contact[] contacts;

    public static void main(String[] args) {

        while (true) {
            String option = menu();
            switch (option) {
                case "0" -> {
                    sin.close();
                    System.exit(0);
                }
                case "1" -> addContact();
                case "2" -> changeContact();
                case "3" -> deleteContact();
                case "4" -> searchContact();
                case "5" -> listContacts();
                default -> System.out.println("Opção inválida!");
            }
        }
    }

    // Menu methods
    private static String menu() {
        System.out.println("Selecione uma opção:");
        System.out.println("1. Inserir contacto");
        System.out.println("2. Alterar contacto");
        System.out.println("3. Apagar contacto");
        System.out.println("4. Procurar contacto");
        System.out.println("5. Listar contactos");
        System.out.println("0. Sair");
        System.out.print("> ");
        return sin.nextLine();
    }

    private static void addContact() {
        System.out.print("Insira o nome: ");
        String name = sin.nextLine();
        System.out.print("Insira o cc: ");
        String ccStr = sin.nextLine();
        int cc = Integer.parseInt(ccStr);
        System.out.print("Insira a data de nascimento (formato: dd-mm-yyyy): ");
        String date = sin.nextLine();
        String[] dateParts = date.split("-");
        DateYMD birthDate = new DateYMD(Integer.parseInt(dateParts[0]), Integer.parseInt(dateParts[1]), Integer.parseInt(dateParts[2]));
        System.out.print("Insira o email: ");
        String email = sin.nextLine();
        System.out.print("Insira o telefone: ");
        String phone = sin.nextLine();
        Person person = new Person(name, cc, birthDate);

        Contact contact = new Contact(person, email, phone);

        if (contacts == null) {
            contacts = new Contact[1];
            contacts[0] = contact;
        } else {
            if (checkIfContactExists(cc)) return;
            Contact[] newContacts = new Contact[contacts.length + 1];
            System.arraycopy(contacts, 0, newContacts, 0, contacts.length);
            newContacts[contacts.length] = contact;
            contacts = newContacts;
        }
    }

    private static void changeContact() {
        System.out.print("Insira o nome, email ou telefone do contacto que pretende alterar: ");
        String query = sin.nextLine();
        int[] indexes = searchContactsIndex(query);
        System.out.printf("Contactos encontrados: %d%n", indexes.length);

        if (indexes.length == 0) {
            System.out.println("Não foram encontrados contactos com esse nome, email ou telefone");
        } else if (indexes.length == 1) {
            System.out.printf("Alterando contacto: %s%n", contacts[indexes[0]]);
            System.out.print("Insira o novo telefone: ");
            String phone = sin.nextLine();
            System.out.print("Insira o novo email: ");
            String email = sin.nextLine();
            contacts[indexes[0]].setPhone(phone);
            contacts[indexes[0]].setEmail(email);
        } else {
            Contact contact = selectContact(indexes);
            System.out.printf("Alterando contacto: %s%n", contact);
            System.out.print("Insira o novo telefone: ");
            String phone = sin.nextLine();
            System.out.print("Insira o novo email: ");
            String email = sin.nextLine();
            contact.setPhone(phone);
            contact.setEmail(email);
        }
    }

    private static void deleteContact() {
        System.out.print("Insira o nome, email ou telefone do contacto que pretende alterar: ");
        String query = sin.nextLine();
        int[] indexes = searchContactsIndex(query);
        System.out.printf("Contactos encontrados: %d%n", indexes.length);

        if (indexes.length == 0) {
            System.out.println("Não foram encontrados contactos com esse nome, email ou telefone");
        } else if (indexes.length == 1) {
            System.out.printf("Apagando contacto: %s%n", contacts[indexes[0]]);
            Contact[] newContacts = new Contact[contacts.length - 1];
            System.arraycopy(contacts, 0, newContacts, 0, indexes[0]);
            System.arraycopy(contacts, indexes[0] + 1, newContacts, indexes[0], contacts.length - indexes[0] - 1);
            contacts = newContacts;
        } else {
            Contact contact = selectContact(indexes);
            System.out.printf("Apagando contacto: %s%n", contact);
            Contact[] newContacts = new Contact[contacts.length - 1];
            System.arraycopy(contacts, 0, newContacts, 0, contact.getId());
            System.arraycopy(contacts, contact.getId() + 1, newContacts, contact.getId(), contacts.length - contact.getId() - 1);
            contacts = newContacts;
        }
    }

    private static void searchContact() {
        System.out.print("Insira o nome, email ou telefone do contacto que pretende alterar: ");
        String query = sin.nextLine();
        int[] indexes = searchContactsIndex(query);
        System.out.printf("Contactos encontrados: %d%n", indexes.length);

        if (indexes.length == 0) {
            System.out.println("Não foram encontrados contactos com esse nome, email ou telefone");
        } else if (indexes.length == 1) {
            System.out.println(contacts[indexes[0]]);
        } else {
            for (int index : indexes)
                System.out.printf("%s%n", contacts[index]);
        }
        System.out.println();
    }

    private static void listContacts() {
        for (Contact c : contacts)
            System.out.printf("%s%n", c);
        System.out.println();
    }

    // Auxiliary methods
    private static boolean checkIfContactExists(int cc) {
        for (Contact c : contacts) {
            if (c.getPerson().getCc() == cc) {
                System.out.print("Já existe um contacto para essa pessoa, pretende criar um novo? (s/n): ");
                String answer = sin.nextLine();
                return !answer.equals("s");
            }
        }
        return true;
    }

    private static int[] searchContactsIndex(String query) {
        int[] indexes = new int[contacts.length];
        int index = 0;
        for (int i = 0; i < contacts.length; i++) {
            if (contacts[i].getPerson().getName().contains(query) || contacts[i].getEmail().contains(query) || contacts[i].getPhone().contains(query)) {
                indexes[index] = i;
                index++;
            }
        }
        return indexes;
    }

    private static Contact selectContact(int[] indexes) {
        System.out.println("Foram encontrados vários contactos com esse nome, email ou telefone, selecione um:");
        for (int index : indexes)
            System.out.printf("%s%n", contacts[index]);

        Contact contact;
        do {
            System.out.print("Insira o ID do contacto que pretende alterar: ");
            int index = sin.nextInt();
            contact = searchContactById(index);
        } while (contact == null);

        return contact;
    }

    private static Contact searchContactById(int id) {
        for (Contact contact : contacts) {
            if (contact.getId() == id) return contact;
        }
        return null;
    }
}
