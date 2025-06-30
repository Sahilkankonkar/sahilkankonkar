import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter a number (a): ");
        int a = sc.nextInt();

        int num = 1; // First odd number 

        for (int i = 0; i < a; i++) {
            System.out.print(num);
            if (i < a - 1) {
                System.out.print(", ");
            }
            num += 2; // Move to next odd number
        }

        sc.close();
    }
}
