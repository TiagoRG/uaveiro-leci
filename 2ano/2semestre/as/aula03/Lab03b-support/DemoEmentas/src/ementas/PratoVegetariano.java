package ementas;

public class PratoVegetariano extends Prato {

    public PratoVegetariano(String nome, double preco) {
        super(nome, preco);
    }

    @Override
    public boolean adicionarIngrediente(Alimento a) {
        if (a instanceof Cereal || a instanceof Legume)
            return super.adicionarIngrediente(a);
        return false;
    }
}
