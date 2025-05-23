import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter a number (a): ");
        int a = sc.nextInt();   

        // If input is even, reduce it by 1
        if (a % 2 == 0) {  
            a -= 1;       
        }

        int num = 1;
        for (int i = 0; i < a; i++) {
            System.out.print(num);
            if (i < a - 1) {
                System.out.print(", ");
            }
            num += 2;
        }

        sc.close();
    }
}
