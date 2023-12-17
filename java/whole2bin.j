// my code

public static int whole2bin(int whole) {
        int number = whole;
        int remainder;
        int count;

        for(count = 0; number != 0; count++) {
            remainder = number % 2;
            number = number / 2;
            mips.push(remainder);
        }

        for(int x = 0; x < count; x++) {
            remainder = mips.pop();
            mips.print_d(remainder);
        }
        mips.print_ci('\n');
        
        return 0;
}