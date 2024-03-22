package ementas;

public class Alimento {
    private double proteinas;
    private double calorias;
    private double peso;


    public Alimento(double proteinas, double calorias, double peso) {
        super();
        this.proteinas = proteinas;
        this.calorias = calorias;
        this.peso = peso;
    }

    public double getProteinas() {
        return proteinas;
    }

    public void setProteinas(double proteinas) {
        this.proteinas = proteinas;
    }

    public double getCalorias() {
        return calorias;
    }

    public void setCalorias(double calorias) {
        this.calorias = calorias;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    @Override
    public String toString() {
        return "Alimento [proteinas=" + proteinas + ", calorias=" + calorias + ", peso=" + peso + "]";
    }


}
