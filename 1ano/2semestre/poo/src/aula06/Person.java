package aula06;

import utils.DateYMD;

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
        if (name == null || name.isEmpty()) {
            throw new IllegalArgumentException("Name cannot be null or empty");
        }
        this.name = name;
    }

    public int getCc() {
        return this.cc;
    }
    public void setCc(int cc) {
        this.cc = cc;
    }

    public DateYMD getBirthDate() {
        return this.birthDate;
    }
    public void setBirthDate(DateYMD birthDate) {
        if (birthDate == null) {
            throw new IllegalArgumentException("Birth date cannot be null");
        }
        this.birthDate = birthDate;
    }

    @Override
    public String toString() {
        return String.format("%s; CC: %d; Date de nascimento: %s", this.name, this.cc, this.birthDate);
    }
}
