package aula11.ex4;

public class Main {
    public static void main(String[] args) {
        FlightManager fm = new FlightManager();

        fm.loadCompanies("datafiles/aula11/ex4/companhias.txt");
        fm.loadFlights("datafiles/aula11/ex4/voos.txt");

        fm.buildTable();
        System.out.println(fm.getTable());

        fm.buildDelaysTable();
        System.out.println(fm.getDelaysTable());

        fm.buildFlightsNTable();
        System.out.println(fm.getFlightsNTable());

        fm.storeTable("datafiles/aula11/ex4/Infopublico.txt");
    }
}
