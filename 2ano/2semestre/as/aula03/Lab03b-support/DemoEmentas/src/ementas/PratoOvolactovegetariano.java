package ementas;

public class PratoOvolactovegetariano extends Prato {

    public PratoOvolactovegetariano(String nomePrato, double preco) {
        super(nomePrato, preco);

    }

    @Override
    public boolean adicionarIngrediente(Alimento a) {
        if (a instanceof Cereal || a instanceof Legume || a instanceof OvoLacto)
            return super.adicionarIngrediente(a);
        return false;
    }

}