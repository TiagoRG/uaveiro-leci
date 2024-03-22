package ementas;

public class PratoDieta extends Prato {
    private final double limiteCalorias;

    public PratoDieta(String nome, double preco, double limiteCalorias) {
        super(nome, preco);
        this.limiteCalorias = limiteCalorias;
    }

    @Override
    public boolean adicionarIngrediente(Alimento alim) {
        if (totalCalorias() + alim.getCalorias() <= limiteCalorias)
            return super.adicionarIngrediente(alim);
        return false;
    }
}
