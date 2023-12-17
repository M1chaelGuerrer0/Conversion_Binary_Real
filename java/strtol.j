// my code
public static int glyph2int(char glyph, int radix) {
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
