import ementas.*;

import java.time.LocalDateTime;
import java.util.Random;

/**
 * entry point da aplicação
 * o código principal está na subpasta ementas
 */
public class DemoClass {

    static final Random randomizer = new Random();

    public static void main(String[] args) {

        System.out.println("\n\nA preparar os dados aleatórios...");
        Ementa ementadeHoje = gerarEmentaAleatoria("Menu Primavera", "Loja 1");

        System.out.println("\n\nEmenta para hoje:" + ementadeHoje);

        // criar um pedido de exemplo
        Cliente cliente = new Cliente("Joao Pinto", "PT120200200");
        Pedido pedido = new Pedido(cliente, LocalDateTime.now());

        // adiciona um prato à sorte, da ementa do dia
        Prato opcao = ementadeHoje.listarPrato(sortearUmPrato());
        pedido.adicionarPrato(opcao);

        // adiciona outro prato à sorte, da ementa do dia
        opcao = ementadeHoje.listarPrato(sortearUmPrato());
        pedido.adicionarPrato(opcao);

        System.out.println("\n\n__Pedido gerado__");
        System.out.println("Pedido: " + pedido);
        Double precoTotal = pedido.calcularTotal();
        System.out.println("Preço do Pedido: " + precoTotal);
        Double calorias = pedido.calcularCalorias();
        System.out.println("Calorias do Pedido: " + calorias);
    }


    /*
     * retorna uma ordem na ementa (e.g. 3º opção da ementa)
     */
    private static int sortearUmPrato() {
        return (randomizer.nextInt(Ementa.NR_PRATOS_NA_EMENTA));
    }


    /*
     * Gera uma ementa, com a designação fornecida em parâmetro, e acrescenta
     * alguns pratos aleatoriamente.
     */
    private static Ementa gerarEmentaAleatoria(String designacao, String local) {
        Ementa ementa = new Ementa(designacao, local, LocalDateTime.now());

        for (int nrOpcaoPrato = 0; nrOpcaoPrato < Ementa.NR_PRATOS_NA_EMENTA; nrOpcaoPrato++) {

            Prato prato = gerarPratoAleatorio(nrOpcaoPrato + 1);
            System.out.println("A gerar .. " + prato);

            // Adiciona 2 ingredientes a cada prato
            int nrIngrediente = 1;
            do {
                Alimento aux = escolherUmAlimentoAleatorio();

                if (prato.adicionarIngrediente(aux)) {
                    System.out.println("\tIngrediente " + nrIngrediente + " adicionado: " + aux);
                    nrIngrediente++;
                } else
                    System.out.println("\tERRO: ingrediente sorteado nao é adequado " + nrIngrediente + ": " + aux);

            } while (nrIngrediente < 3);

            ementa.addPrato(prato);
        }
        return ementa;
    }

    /*
     * Gera uma ocorrencia de Alimento, com dados aleatorios
     */
    public static Alimento escolherUmAlimentoAleatorio() {

        Alimento resultado;
        switch (randomizer.nextInt(4)) {
            case 0:
                resultado = new Carne(VariedadeCarne.FRANGO, 22.3, 345.3, 300);
                break;
            case 1:
                resultado = new Peixe(TipoPeixe.CONGELADO, 31.3, 25.3, 200);
                break;
            case 2:
                resultado = new Legume("Couve Flor", 21.3, 22.4, 150);
                break;
            default:
                resultado = new Cereal("Milho", 19.3, 32.4, 110);
                break;
        }
        return resultado;
    }

    /*
     * Gera uma ocorrencia de Prato, com dados aleatorios
     */
    public static Prato gerarPratoAleatorio(int i) {
        Prato resultado;
        switch (randomizer.nextInt(3)) {
            case 0:
                resultado = new Prato("Combinado n." + i, 100.0);
                break;
            case 1:
                resultado = new PratoVegetariano("Vegetariano n." + i, 120.0);
                break;
            default:
                resultado = new PratoDieta("Dieta n." + i, 200, 90.8);
                break;
        }
        return resultado;
    }


    public static Alimento randAlimento() {
        throw new UnsupportedOperationException();
    }


}
