package aula06.ex1;

import utils.DateYMD;

import java.util.Objects;

public class Person {
    private String name;
    private int cc;
    private DateYMD birthDate;

    public Person(String name, int cc, DateYMD birthDate) {
        this.setName(name);
        this.setCc(cc);
        this.setBirthDate(birthDate);
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        if (name == null || name.isEmpty())
            throw new IllegalArgumentException("Name cannot be null or empty");
        this.name = name;
    }

    public int getCc() {
        return this.cc;
    }

    public void setCc(int cc) {
        if (String.valueOf(cc).length() != 8)
            throw new IllegalArgumentException("CC must have 8 digits");
        this.cc = cc;
    }

    public DateYMD getBirthDate() {
        return this.birthDate;
    }

    public void setBirthDate(DateYMD birthDate) {
        if (birthDate == null)
            throw new IllegalArgumentException("Birth date cannot be null");
        this.birthDate = birthDate;
    }

    @Override
    public String toString() {
        return String.format("%s; CC: %d; Data de nascimento: %s", this.name, this.cc, this.birthDate);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Person person = (Person) o;
        return cc == person.cc && Objects.equals(name, person.name) && Objects.equals(birthDate, person.birthDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, cc, birthDate);
    }
}
