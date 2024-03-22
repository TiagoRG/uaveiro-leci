package ementas;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;


/**
 * representa um pedido de um cliente
 */
public class Pedido {
    private final Cliente cliente;
    private final List<Prato> opcoes;
    private LocalDateTime hora;

    public Pedido(Cliente cliente, LocalDateTime hora) {
        this.cliente = cliente;
        this.hora = hora;
        opcoes = new ArrayList<>();
    }


    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();

        builder.append(cliente);
        builder.append("\n");
        for (Prato prato : opcoes) {
            builder.append("\t prato: ");
            builder.append(prato);
            builder.append("\n");
        }
        builder.append("datahora=");
        builder.append(DateTimeFormatter.ISO_LOCAL_DATE_TIME.format(hora));
        builder.append("]");

        return builder.toString();
    }

    public double calcularTotal() {
        double parcial;
        double total = 0;
        for (Prato prato : opcoes) {
            parcial = prato.getPreco();
            total = total + parcial;
        }
        return total;
    }

    public double calcularCalorias() {
        double parcial;
        double total = 0;
        for (Prato prato : opcoes) {
            parcial = prato.totalCalorias();
            total = total + parcial;
        }
        return total;
    }

    public void setHora(java.time.LocalDateTime value) {
        this.hora = value;
    }

    public void adicionarPrato(Prato pratoEscolhido) {
        opcoes.add(pratoEscolhido);

    }

}
