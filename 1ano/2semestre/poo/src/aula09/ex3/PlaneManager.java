package aula09.ex3;

import java.util.LinkedList;

public class PlaneManager {
    private final LinkedList<Plane> planes = new LinkedList<>();

    public void addPlane(Plane plane) {
        planes.add(plane);
    }

    public void removePlane(String id) {
        for (Plane plane : planes) {
            if (plane.getId().equals(id)) {
                planes.remove(plane);
                return;
            }
        }
    }

    public Plane searchPlane(String id) {
        for (Plane plane : planes) {
            if (plane.getId().equals(id)) {
                return plane;
            }
        }
        return null;
    }

    public LinkedList<Plane> getCommercialPlanes() {
        LinkedList<Plane> commercialPlanes = new LinkedList<>();
        for (Plane plane : planes) {
            if (plane instanceof CommercialPlane) {
                commercialPlanes.add(plane);
            }
        }
        return commercialPlanes;
    }

    public LinkedList<Plane> getMilitaryPlanes() {
        LinkedList<Plane> militaryPlanes = new LinkedList<>();
        for (Plane plane : planes) {
            if (plane instanceof MilitaryPlane) {
                militaryPlanes.add(plane);
            }
        }
        return militaryPlanes;
    }

    public Plane getFastestPlane() {
        Plane fastestPlane = null;
        for (Plane plane : planes) {
            if (fastestPlane == null || plane.getMaxSpeed() > fastestPlane.getMaxSpeed()) {
                fastestPlane = plane;
            }
        }
        return fastestPlane;
    }

    public void printAllPlanes() {
        for (Plane plane : planes) {
            System.out.println(plane);
        }
    }

    public void printAllPlanes(String type) {
        for (Plane plane : planes) {
            if (plane instanceof CommercialPlane && type.equals("commercial")) {
                System.out.println(plane);
            } else if (plane instanceof MilitaryPlane && type.equals("military")) {
                System.out.println(plane);
            }
        }
    }
}
