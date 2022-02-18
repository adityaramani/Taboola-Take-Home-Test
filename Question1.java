/*
The below function expects a string as an input and tries to convert it into an integer value.
Some basic checking is done while performing this conversion.
The input is stripped of any leading/trailing whitespace.
In case there is a character that is not between 0-9 we flag the input as invalid and exit the program.

We have also assumed that the numeric string that is the input is can fit in an int variable.
i.e in the range -2147483648 to 2147483647

The program exepects the numeric string to be passed through standard input

Usage: 

$ javac Question1.java

$ java Question1

*/

import java.util.Scanner;

public class Question1 {

    public static int stringToInt(String numString) {

        int result = 0;

        int i = 0;

        int sign = 1;
        if (numString.charAt(i) == '-') {
            sign = -1;
            i++;
        }

        for (; i < numString.length(); i++) {
            char ch = numString.charAt(i);
            int ascii = (int) ch;

            if (ascii >= (int) '0' && ascii <= (int) '9') {
                ascii -= (int) '0';
                result = result * 10 + ascii;
            }

            else {
                System.out.println("Given string is not a valid integer");
                System.exit(0);
            }

        }

        return result * sign;
    }

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter a string to parse:");
        String number = scanner.nextLine().strip();
        System.out.println(stringToInt(number));
        scanner.close();
    }

}
