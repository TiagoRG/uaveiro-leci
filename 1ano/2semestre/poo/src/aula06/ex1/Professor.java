package aula06.ex1;

import utils.DateYMD;

public class Professor extends Person {
    private String category;
    private String department;

    public Professor(String name, int cc, DateYMD birthDate, String category, String department) {
        super(name, cc, birthDate);
        this.setCategory(category);
        this.setDepartment(department);
    }

    public String getCategory() {
        return this.category;
    }

    public void setCategory(String category) {
        if (category == null || category.isEmpty())
            throw new IllegalArgumentException("Category cannot be null or empty");
        if (!(category.equals("Auxiliar") || category.equals("Associado") || category.equals("Catedrático")))
            throw new IllegalArgumentException("Invalid category");
        this.category = category;
    }

    public String getDepartment() {
        return this.department;
    }

    public void setDepartment(String department) {
        if (department == null || department.isEmpty())
            throw new IllegalArgumentException("Department cannot be null or empty");
        this.department = department;
    }

    @Override
    public String toString() {
        return String.format("%s; CC: %d; Date de nascimento: %s; Categoria: %s; Departamento: %s", this.getName(), this.getCc(), this.getBirthDate(), this.category, this.department);
    }
}
