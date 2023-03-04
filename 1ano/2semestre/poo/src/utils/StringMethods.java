package utils;

public class StringMethods {
    public static int countDigits(String s) {
        int count = 0;
        for (char c : s.toCharArray())
            if (Character.isDigit(c))
                count++;
        return count;
    }

    public static int countSpaces(String s) {
        int count = 0;
        for (char c : s.toCharArray())
            if (c == ' ')
                count++;
        return count;
    }

    public static boolean isAllLower(String s) {
        for (char c : s.toCharArray())
            if (Character.isUpperCase(c))
                return false;
        return true;
    }

    public static String removeDuplicatedSpaces(String s) {
        StringBuilder newStr = new StringBuilder();
        for (char c : s.toCharArray())
            if (c != ' ' || !newStr.substring(newStr.length() - 1).equals(" "))
                newStr.append(c);
        return newStr.toString();
    }

    public static boolean isPalindrome(String s) {
        char[] chars = s.toCharArray();
        for (int i = 0; i < s.length() / 2; i++)
            if (chars[i] != chars[chars.length - 1 - i])
                return false;
        return true;
    }

    public static String getAcronym(String s) {
        String[] words = s.split(" ");
        StringBuilder acronym = new StringBuilder();
        for (String word : words)
            if (word.length() >= 3)
                acronym.append(word.charAt(0));
        return acronym.toString().toUpperCase();
    }
}
