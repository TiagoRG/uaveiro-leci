package aula10.ex3;

public class Main {
    public static void main(String[] args) {
        CharacterCounter counter = new CharacterCounter("Hello World!");
        counter.count();
        System.out.println(counter.getCounter());
        counter.indexes();
        System.out.println(counter.getIndexes());
    }
}
