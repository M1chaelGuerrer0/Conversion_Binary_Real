// my code
public static int value_of_max(int number) {
        int max;
      
        max = 10;
        for (int i=0;  number >= max ;i++) {
            if( i > 8) break;
            max = max * 10;
        }
        return max;
}
public static int fractional2bin(int fractional, int max_bits) {
        int max = value_of_max(fractional);
        int number = fractional;
        while (number != 0 ) {
            number = number * 2; 
            if (number >= max) {
                mips.print_di(1);
                number = number - max;
            }
            else {
               mips.print_di(0);
            }
            max_bits--;
            if(max_bits == 0) {
                break;
            }
        }
        mips.print_ci('\n');
        return 0;
}