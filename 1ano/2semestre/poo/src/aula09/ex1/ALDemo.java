package aula09.ex1;

import aula06.ex1.Person;
import utils.DateYMD;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

public class ALDemo {
    public static void main(String[] args) {
        ArrayList<Integer> c1 = new ArrayList<>();
        for (int i = 10; i <= 100; i += 10) c1.add(i);
        System.out.println("Size: " + c1.size());

        for (int i = 0; i < c1.size(); i++)
            System.out.println("Elemento: " + c1.get(i));

        ArrayList<String> c2 = new ArrayList<>();
        c2.add("Vento");
        c2.add("Calor");
        c2.add("Frio");
        c2.add("Chuva");
        System.out.println(c2);
        Collections.sort(c2);
        System.out.println(c2);
        c2.remove("Frio");
        c2.remove(0);
        System.out.println(c2);

        Set<Person> c3 = new HashSet<>();
        c3.add(new Person("Ana", 12345678, new DateYMD(1, 1, 2000)));
        c3.add(new Person("Joao", 42342289, new DateYMD(1, 1, 2000)));
        c3.add(new Person("Maria", 12346789, new DateYMD(1, 1, 2000)));
        c3.add(new Person("Marco", 12356789, new DateYMD(1, 1, 2000)));
        c3.add(new Person("Ana", 12346789, new DateYMD(1, 1, 2000)));

        for (Person p : c3) {
            System.out.println(p);
        }
    }
}
