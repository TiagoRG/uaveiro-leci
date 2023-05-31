package aula06.ex1;

import utils.DateYMD;

public class Bolser extends Student {
    private Professor supervisor;
    private double monthlyAmount;

    public Bolser(String name, int cc, DateYMD birthDate, DateYMD registrationDate, Professor supervisor, double monthlyAmount) {
        super(name, cc, birthDate, registrationDate);
        this.setSupervisor(supervisor);
        this.setMonthlyAmount(monthlyAmount);
    }

    public Bolser(String name, int cc, DateYMD birthDate, Professor supervisor, double monthlyAmount) {
        this(name, cc, birthDate, null, supervisor, monthlyAmount);
    }

    public Professor getSupervisor() {
        return this.supervisor;
    }

    public void setSupervisor(Professor supervisor) {
        if (supervisor == null) {
            throw new IllegalArgumentException("Supervisor cannot be null");
        }
        this.supervisor = supervisor;
    }

    public double getMonthlyAmount() {
        return this.monthlyAmount;
    }

    public void setMonthlyAmount(double monthlyAmount) {
        if (monthlyAmount < 0) {
            throw new IllegalArgumentException("Monthly amount cannot be negative");
        }
        this.monthlyAmount = monthlyAmount;
    }

    @Override
    public String toString() {
        return String.format("%s; CC: %d; Date de nascimento: %s; Data de matrícula: %s; NMec: %d; Supervisor: %s; Montante mensal: %.2f", this.getName(), this.getCc(), this.getBirthDate(), this.getRegistrationDate(), this.getNMec(), this.supervisor, this.monthlyAmount);
    }
}
