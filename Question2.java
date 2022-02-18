/*
The program exepects the string to be checked passed through standard input

Usage: 

$ javac Question2.java

$ java Question2

*/

import java.util.Scanner;

public class Question2 {

    public static boolean stringContainsInt(String numString) {

        boolean result = false;

        for (int i = 0; i < numString.length(); i++) {
            char ch = numString.charAt(i);
            int ascii = (int) ch;

            if (ascii >= (int) '0' && ascii <= (int) '9') {
                result = true;
                break;
            }

        }

        return result;
    }

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter a string to check:");
        String number = scanner.nextLine().strip();
        System.out.println(stringContainsInt(number));
        scanner.close();
    }

}
