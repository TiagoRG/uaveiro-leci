package aula10.ex3;

import java.util.HashMap;
import java.util.LinkedList;

public class CharacterCounter {
    private final HashMap<Character, Integer> counter = new HashMap<>();
    private final HashMap<Character, LinkedList<Integer>> indexes = new HashMap<>();
    private final String text;

    public CharacterCounter(String text) {
        this.text = text;
    }

    public void count() {
        for (char c : this.text.toCharArray()) {
            if (this.counter.containsKey(c)) {
                this.counter.put(c, this.counter.get(c) + 1);
            } else {
                this.counter.put(c, 1);
            }
        }
    }

    public void indexes() {
        for (int i = 0; i < this.text.length(); i++) {
            char c = this.text.charAt(i);
            if (this.indexes.containsKey(c)) {
                this.indexes.get(c).add(i);
            } else {
                LinkedList<Integer> list = new LinkedList<>();
                list.add(i);
                this.indexes.put(c, list);
            }
        }
    }

    public HashMap<Character, Integer> getCounter() {
        return this.counter;
    }

    public HashMap<Character, LinkedList<Integer>> getIndexes() {
        return this.indexes;
    }
}
