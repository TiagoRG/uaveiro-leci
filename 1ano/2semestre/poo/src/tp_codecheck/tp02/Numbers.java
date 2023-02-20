package tp_codecheck.tp02;

public class Numbers {
    public static void main(String[] args) {
        // Different arrays will be substituted here.
        int[] values = { 3, 1, 4, 1, 5, 9 };
        int[] newValues = new int[values.length/2];
        
        for (int x = 0; x < values.length; x+=2) {
            newValues[x/2] = values[x];
        }
        
        for (int i = 0; i < newValues.length; i++) {
            System.out.println(newValues[i]);
        }
    }
}
