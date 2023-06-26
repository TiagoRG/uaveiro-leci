package aval.ef_2223.Classes;

import aval.ef_2223.Enums.ClientType;

import java.util.Objects;

public class Client {
    private int taxId;
    private String name;
    private ClientType clientType;

    public Client(int taxId, String name, ClientType clientType) {
        this.taxId = taxId;
        this.name = name;
        this.clientType = clientType;
    }

    public int getTaxId() {
        return taxId;
    }

    public void setTaxId(int taxId) {
        this.taxId = taxId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ClientType getClientType() {
        return clientType;
    }

    public void setClientType(ClientType clientType) {
        this.clientType = clientType;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Client client)) return false;
        return getTaxId() == client.getTaxId() && Objects.equals(getName(), client.getName()) && getClientType() == client.getClientType();
    }

    @Override
    public int hashCode() {
        return Objects.hash(getTaxId(), getName(), getClientType());
    }

    @Override
    public String toString() {
        return String.format("%s [%s: %d]", getName(), getClientType(), getTaxId());
    }
}
