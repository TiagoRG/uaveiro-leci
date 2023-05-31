package aula06.ex1;

import utils.DateYMD;

import java.time.LocalDate;

public class Student extends Person {
    public static int currentNMec = 100;
    private DateYMD registrationDate;
    private int nMec;

    public Student(String name, int cc, DateYMD birthDate, DateYMD registrationDate) {
        super(name, cc, birthDate);
        this.setRegistrationDate(registrationDate);
        this.setNMec(Student.currentNMec++);
    }

    public Student(String name, int age, DateYMD birthDate) {
        this(name, age, birthDate, null);
    }

    public int getNMec() {
        return this.nMec;
    }

    public void setNMec(int nMec) {
        this.nMec = nMec;
    }

    public DateYMD getRegistrationDate() {
        return this.registrationDate;
    }

    public void setRegistrationDate(DateYMD registrationDate) {
        LocalDate now = LocalDate.now();
        this.registrationDate = registrationDate == null ? new DateYMD(now.getDayOfMonth(), now.getMonthValue(), now.getYear()) : registrationDate;
    }

    @Override
    public String toString() {
        return String.format("%s; CC: %d; Date de nascimento: %s; Data de matrícula: %s; NMec: %d", this.getName(), this.getCc(), this.getBirthDate(), this.registrationDate, this.nMec);
    }
}
