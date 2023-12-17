        .text
        .include "macros/syscalls.s"
        .include "macros/stack.s"
        .globl glyph2int
        .globl strtol
glyph2int:      nop                 # public static int glyph2int(char $a0, int $a1) {
        #  a0 : glyph
        #  a1 : radix
        #  t0 : glyph
        #  t1 : radix
        #  t2 : value
        #  v0 : value

        # Save S registers
        push_s_registers()
        # Demarshal input arguments #
        move $t0, $a0               #         $t0 = $a0;
        move $t1, $a1               #         $t1 = $a1;
        #############################            
        subi $t2, $zero, 1          #         $t2 = -1;
        blt $t0, '0', else2         #         if('0' <= $t0) {
            bgt $t0, '9', else2     #             if($t0 <= '9') {
cons1:          nop                 # cons1:          ;
                sub $t2, $t0, '0'   #                 $t2 = $t0 - '0';
                b done_1            #                 // goto done_1
                                    #             }
                                    #         }
else2:  nop                         # else2:  ;
        blt $t0, 'A', else3         #         if('A' <= $t0) {
            bgt $t0, 'F', else3     #              if($t0 <= 'F') {
cons2:          nop                 # cons2:          ;
                sub $t2, $t0, 'A'   #                 $t2 = $t0 - 'A';
                addi $t2, $t2, 10   #                 $t2 = $t2 + 10;
                b done_1            #                 // goto done_1 
                                    #             }
                                    #         }
else3:  nop                         # else3:  ;
        blt $t0, 'a', done_2        #         if ('a' <= $t0) {
            bgt $t0, 'f', done_2    #             if($t0 <= 'f') {
cons3:          nop                 # cons3:          ;      
                sub $t2, $t0, 'a'   #                 $t2 = $t0 - 'a';
                addi $t2, $t2, 10   #                 $t2 = $t2 + 10;
                b done_1            #                 // goto done_1
                                    #             }
                                    #         }
done_1: nop                         # done_1:   ;
        blt $t2, $t1, done_2        #         if($t2 >= $t1) {
cons4:      nop                     # cons4:      ;        
            subi $t2, $zero, 1      #             $t2 = -1;
            b done_2                #             // goto done_2
                                    #         }
done_2: nop                         # done_2: ;         
        #############################
        # Marshal return value
        move $v0, $t2               #         $v0 = $t2;  
        # Restore S registers
        pop_s_registers()
        jr $ra                      #         return $v0;
                                    # }
                                    # 
strtol: nop                         # public static int strtol( char[] $a0, int $a1) {
        # a0 : buffer
        # a1 : radix
        # t0 : buffer
        # t1 : radix
        # t2 : buffer_length
        # t3 : digit
        # t4 : x
        # t5 : value
        # t6 : temp
        # t7 : p
        # v0 : value
                                               
        # Save S registers
        push_s_registers()
        # Demarshal input arguments
        move $t0, $a0               #         $t0 = $a0;
        move $t1, $a1               #         $t1 = $a1;
        #############################        
        li $t2, 256                 #         $t2 = 256;
        li $t5, 0                   #         $t5 = 0;
                                    #   
        li $t4, 0                   #         $t4 = 0;
loop:   bge $t4, $t2, done_3        # loop:   for(; $t4 < $t2;) {  
body:       nop                     # body:       ;        
            la $t7, ($t0)
            add $t7, $t7, $t4
            lb $t6, 0($t7)          #             $t6 = $t0[$t4];
            #########################             $t3 = glyph2int($t6, $t1);
            move $a0, $t6           # Marshal input arguments
            move   $a1, $t1         #
            push_t_registers        # Save T Registers
            push $ra, $sp, $fp, $gp # Save special registers
            jal glyph2int           #   
            pop $ra, $sp, $fp, $gp  # Restore special registers
            pop_t_registers         # Restore T Registers
            move $t3, $v0           # Demarshal return value
            #########################
            beq $t3, -1, done_3     #             if($t3 == -1) {
                                    #                 break;
                                    #             }
            mult $t5, $t1           #             $t5 = $t5 * $t1;
            mflo $t5
            add $t5, $t5, $t3       #             $t5 = $t5 + $t3;
next:       nop                     # next:       ;
            addi $t4, $t4, 1        #             $t4 = $t4 + 1;
            b loop                  #             continue loop;
                                    #         }
done_3: nop                         # done_3: ;
        #############################
        # Marshal return value
        move $v0, $t5               #         $v0 = $t5;
        # Restore S registers
        pop_s_registers()
        jr $ra                      #         return $v0;     
                                    # }
