package ementas;

/**
 * cliente que coloca novas encomendas/pedidos
 */
public class Cliente {

    private String nome;
    private String nif;

    public Cliente(String nome, String nif) {
        this.setNome(nome);
        this.setNif(nif);
    }

    @Override
    public String toString() {
        return "Cliente = " + getNome() + ", " + getNif();
    }

    public java.lang.String getNome() {
        return this.nome;
    }

    public void setNome(java.lang.String value) {
        this.nome = value;
    }

    public String getNif() {
        return nif;
    }

    public void setNif(String nif) {
        this.nif = nif;
    }
}
