package aula08.ex1;

import java.util.Scanner;

public class Main {
    private static final Scanner sin = new Scanner(System.in);
    private static VehicleComp[] vehicleComps;

    public static void main(String[] args) {
        while (true) {
            System.out.println("Choose an option\n1 - Create new company\n2 - Delete company\n3 - List companies\n4 - Manage company\n0 - Exit");
            int mainOption = Integer.parseInt(sin.nextLine());
            switch (mainOption) {
                case 0 -> {
                    sin.close();
                    System.exit(0);
                }
                case 1 -> {
                    System.out.print("New company name: ");
                    String name = sin.nextLine();
                    VehicleComp vehicleComp = new VehicleComp(name);

                    if (vehicleComps == null) {
                        vehicleComps = new VehicleComp[1];
                        vehicleComps[0] = vehicleComp;
                    } else {
                        VehicleComp[] newVehicleComps = new VehicleComp[vehicleComps.length + 1];
                        System.arraycopy(vehicleComps, 0, newVehicleComps, 0, vehicleComps.length);
                        newVehicleComps[newVehicleComps.length - 1] = vehicleComp;
                        vehicleComps = newVehicleComps;
                    }
                }
                case 2, 3, 4 -> {
                    for (VehicleComp vehicleComp : vehicleComps)
                        System.out.println(vehicleComp);
                    if (mainOption == 2) {
                        System.out.print("Name of the company to remove: ");
                        String name = sin.nextLine();
                        VehicleComp[] newVehicleComps = new VehicleComp[vehicleComps.length - 1];
                        int index = 0;
                        for (VehicleComp vC : vehicleComps)
                            if (!vC.getName().equals(name))
                                newVehicleComps[index++] = vC;
                        vehicleComps = newVehicleComps;
                    }
                    if (mainOption == 4) {
                        System.out.print("Name of the company to manage: ");
                        String name = sin.nextLine();
                        for (VehicleComp vehicleComp : vehicleComps)
                            if (vehicleComp.getName().equals(name))
                                manageComp(vehicleComp);
                    }
                }
                default -> System.out.println("Invalid option");
            }
        }
    }

    private static void manageComp(VehicleComp vehicleComp) {
        while (true) {
            System.out.println("Choose an option\n1 - List vehicle\n2 - Get vehicle info\n3 - Vehicle with most Km\n4 - Send vehicle on a trip\n5 - Add Vehicle\n6 - Remove vehicle\n0 - Exit");
            int mainOption = Integer.parseInt(sin.nextLine());
            switch (mainOption) {
                case 0 -> {
                    return;
                }
                case 1 -> vehicleComp.listVehicles();
                case 2 -> {
                    System.out.print("Vehicle plate: ");
                    System.out.println(vehicleComp.getVehicleByPlate(sin.nextLine()));
                }
                case 3 -> vehicleComp.printVehicleWithMostKm();
                case 4 -> vehicleComp.tripMenu(sin);
                case 5 -> vehicleComp.addVehicleMenu(sin);
                case 6 -> vehicleComp.removeVehicleMenu(sin);
                default -> System.out.println("Invalid option");
            }
        }
    }
}
