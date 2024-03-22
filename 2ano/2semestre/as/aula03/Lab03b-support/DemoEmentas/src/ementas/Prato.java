package ementas;

import java.util.ArrayList;
import java.util.List;

public class Prato {

    private final String nome;
    private final List<Alimento> listaAlimentos;
    private final int contagemIngredientes;

    private final double preco;

    public Prato(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
        listaAlimentos = new ArrayList<>();
        contagemIngredientes = 0;
    }

    public String getNome() {
        return nome;
    }


    @Override
    public String toString() {
        return "Prato [nome=" + nome + "," + contagemIngredientes + " ingredientes, preco " + preco + "]";
    }

    public boolean adicionarIngrediente(Alimento alimento) {
        listaAlimentos.add(alimento);
        return true;
    }

    public String alimentosInfo() {
        String msg = "";

        for (Alimento alimento : listaAlimentos) {
            msg = msg.concat(alimento.toString());
        }
        return msg;
    }


    public double totalPeso() {
        double p = 0;
        for (Alimento alimento : listaAlimentos) {
            p = p + alimento.getPeso();
        }
        return p;
    }


    public double totalCalorias() {
        Double parcial;
        double calorias = 0.0;

        for (Alimento alim : listaAlimentos) {
            parcial = alim.getCalorias();
            calorias = calorias + parcial;
        }
        return calorias;
    }


    public double totalProteinas() {
        double parcial;
        double proteinas = 0;
        for (Alimento alim : listaAlimentos) {
            parcial = alim.getCalorias();
            proteinas = proteinas + parcial;
        }
        return proteinas;
    }

    public double getPreco() {
        return this.preco;
    }

}
