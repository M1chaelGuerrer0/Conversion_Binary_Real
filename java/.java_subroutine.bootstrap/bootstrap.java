class binaryReal {
   static MIPS_OS_Interface mips = new MIPS_OS_Interface();

public static int binaryReal(char[] arg0, char[] arg1, char[] arg2, char[] arg3) {
   char [] arg4 = null;     // Additional Formal Arguments which is on the static

   int  radix;
   char sharp;
   int  whole;
   int  point;
   int  fractional;

   final int max_bits = 23;

   arg4 = mips.pop(arg4);

   radix      = strtol(arg0, 10);
   sharp      = arg1[0];
   whole      = strtol(arg2, radix);
   point      = arg3[0];
   fractional = strtofrac(arg4, radix);

   mips.print_ci('2'); 
   mips.print_ci('#');
   mips.print_ci(' ');

   whole2bin(whole);     
   mips.print_ci('.');
   fractional2bin(fractional, max_bits);
   mips.print_ci('\n');

   return radix;
}public static int value_of_max(int number) {
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
}public static int strtofrac(char[] buffer, int radix) {

    int retval;

    double value;
    double denom;

    int i;
    int digit;


    value = 0;
    denom = radix;
    for (i=0; buffer[i] != '\0'; i++ ) {
       digit = glyph2int(buffer[i], radix);

       if (digit == -1 ) break;
       
       value = value +  digit / denom;
       denom = denom * radix;
    }

    for (; i > 0 ;) {
        value = value * 10;
        i--;
    }
    return (int) value;
}public static int glyph2int(char glyph, int radix) {
        int value = -1;

        if ('0' <= glyph && glyph <= '9') {
                value = glyph - '0';
        }
        if ('A' <= glyph && glyph <= 'F') {
                value = glyph - 'A' + 10; 
        }
        if ('a' <= glyph && glyph <= 'f') {      
                value = glyph - 'a' + 10;
        }
        if(value >= radix) {        
            value = -1;
        }         
        return value;
}

public static int strtol( char[] buffer, int radix) {
        int buffer_length = 256; 
        int digit;
        int value = 0;

        for(int x = 0; x < buffer_length; x++) {          
            digit = glyph2int(buffer[x], radix); 
            if(digit == -1) {
                break;
            }
            value = value * radix+ digit;
        }
        return value;
}
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
  public static void main(String[] args) {
  
    int index;
    String string_0 = "8";
    char $a0[] = new char[ (string_0).length() + 2];
         for (index=0; index < $a0.length - 2; index++ ) {
           $a0[index] = (string_0).charAt(index);
         }
         $a0[index] = '\0' ; // the Null character
         $a0[index+1] = '\7' ; // the Alert character
    String string_1 = "#";
    char $a1[] = new char[ (string_1).length() + 2];
         for (index=0; index < $a1.length - 2; index++ ) {
           $a1[index] = (string_1).charAt(index);
         }
         $a1[index] = '\0' ; // the Null character
         $a1[index+1] = '\7' ; // the Alert character
    String string_2 = "1234";
    char $a2[] = new char[ (string_2).length() + 2];
         for (index=0; index < $a2.length - 2; index++ ) {
           $a2[index] = (string_2).charAt(index);
         }
         $a2[index] = '\0' ; // the Null character
         $a2[index+1] = '\7' ; // the Alert character
    String string_3 = ".";
    char $a3[] = new char[ (string_3).length() + 2];
         for (index=0; index < $a3.length - 2; index++ ) {
           $a3[index] = (string_3).charAt(index);
         }
         $a3[index] = '\0' ; // the Null character
         $a3[index+1] = '\7' ; // the Alert character
    String string_4 = "4300000";
    char $a4[] = new char[ (string_4).length() + 2];
         for (index=0; index < $a4.length - 2; index++ ) {
           $a4[index] = (string_4).charAt(index);
         }
         $a4[index] = '\0' ; // the Null character
         $a4[index+1] = '\7' ; // the Alert character

    mips.push($a4);
    int $v0 = binaryReal($a0, $a1, $a2, $a3);

    // Augment this code based upon desired output type

    mips.print_ci('\n');   // Print extra '\n' in case the users
                           // last line does not include the 
                           // proforma '\n'.
    mips.print_d($v0);
    mips.print_ci('\n');
    return;
  }
}
