package aula06.ex2;

import aula06.ex1.Person;

public class Contact {
    private static int currentId = 1;
    private final int id;
    private Person person;
    private String email;
    private String phone;

    public Contact(Person person, String email, String phone) {
        if ((email == null || email.isEmpty()) && (phone == null || phone.isEmpty()))
            throw new IllegalArgumentException("Either email or phone must be provided");
        this.id = Contact.currentId++;
        this.setPerson(person);
        this.setEmail(email);
        this.setPhone(phone);
    }

    public int getId() {
        return id;
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        if (person == null)
            throw new IllegalArgumentException("Person must be provided");
        this.person = person;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        if (!(email == null || email.isEmpty()) &&
                !email.matches("^[a-zA-Z_0-9.]+@[a-zA-Z_0-9.]+\\.[a-zA-Z_0-9]+$"))
            throw new IllegalArgumentException("Invalid email");
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        if (!(phone == null || phone.isEmpty()) &&
                !phone.matches("^9[0-9]{8}$"))
            throw new IllegalArgumentException("Invalid phone");
        this.phone = phone;
    }

    @Override
    public String toString() {
        return String.format("ID: %d%nPerson: %s%nEmail: %s%nPhone: %s", this.id, this.person, this.email, this.phone);
    }
}
