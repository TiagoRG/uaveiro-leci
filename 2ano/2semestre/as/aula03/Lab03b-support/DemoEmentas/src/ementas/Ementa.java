package ementas;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class Ementa {

    public static final int NR_PRATOS_NA_EMENTA = 4;

    private String nome;
    private String local;
    private final List<Prato> pratos;

    private final LocalDateTime dia;

    public Ementa(String nome, String local, LocalDateTime dia) {
        this.nome = nome;
        this.local = local;
        this.dia = dia;
        this.pratos = new ArrayList<Prato>(); // inicia uma lista vazia
    }


    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getLocal() {
        return local;
    }

    public void setLocal(String local) {
        this.local = local;
    }

    @Override
    public String toString() {

        StringBuilder builder = new StringBuilder();

        builder.append("Ementa [nome=" + nome + ", local=" + local + ", dia " + DateTimeFormatter.ISO_LOCAL_DATE.format(dia) + "]\n");
        for (Prato prato : pratos) {
            builder.append("\t");
            builder.append(prato.getNome());
            builder.append("\t");
            builder.append(prato.getPreco());
            builder.append("\n");
        }
        builder.append("]");
        return builder.toString();

    }

    public double getTotalEmenta() {
        double sum = 0;
        for (Prato prato : pratos) {
            sum += prato.getPreco();
        }
        return sum;
    }

    public void addPrato(Prato prato) {
        pratos.add(prato);
    }

    public Prato listarPrato(int ordem) {
        return pratos.get(ordem);
    }

    public void listarPratos() {
        // ainda não foi implementado
        throw new UnsupportedOperationException();
    }
}
