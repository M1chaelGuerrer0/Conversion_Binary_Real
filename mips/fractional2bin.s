# my code

        .text
        .include "macros/syscalls.s"
        .include "macros/stack.s"
        .globl value_of_max
        .globl fractional2bin
value_of_max:   nop                     #  public static int value_of_max(int number) {
                # t1: max               # int max;
                # t2: i                 # int i;
                # s0: 8                 # int _8;
                # s1: 10                # int _10;
            
                push_s_registers()      # Save S registers
                move $t0, $a0           # Demarshal input arguments
            
                li $t1, 10              # max = 10;
                li $t2, 0               # i=0;
                li $s0, 8               # _8 = 8;
                li $s1, 10              # _10 = 10;
            
      loop2:    blt $t0, $t1, done2     # for (; number >= max ;) {
                    bgt $t2, $s0, loop2 #    if( i > _8) break loop2;
                    mul $t1, $t1, $s1   #    max = max * _10;
                    addi $t2, $t2, 1    #    i++;
                b loop2                 #    continue loop2;
                                        # }
      done2:    nop                     # ;
                                        # return max;
                move $v0, $t1           # Marshal output value
                pop_s_registers()       # Restore S registers                          
                jr $ra
                                        # }
fractional2bin: nop                     # public static int fractional2bin(int $a0, int $a1) {
                # a0 : fractional
                # a1 : max_bits
                # t0 : fractional
                # t1 : max_bits
                # t2 : max

                # Save S registers
                push_s_registers()
                # Demarshal input arguments
                move $t0, $a0                 #         $t0 = $a0;
                move $t1, $a1                 #         $t1 = $a1;
                ###############################                     
                ###############################   $t2 = value_of_max($t0);
                move $a0, $t0                 # Marshal arg
                push_t_registers()            # Save T registers
                push $ra, $sp, $fp, $gp       # Save special registers
                jal value_of_max              #
                pop $ra, $sp, $fp, $gp        # Restore special registers
                pop_t_registers()             # Restore T registers
                move $t2, $v0                 # Demarshal return value
                ###############################
loop_2:         beq $t0, 0, done_2            # loop_2: for(;$t0 != 0;) {
body_2:         nop                           # body_2:     ;
                    mul $t0, $t0, 2           #             $t0 = $t0 * 2; 
                    blt $t0, $t2, alt_1       #             if ($t0 >= $t2) {
cons_1:             nop                       # cons_1:         ;           
                        print_di(1)           #                 mips.print_di(1);
                        sub $t0, $t0, $t2     #                 $t0 = $t0 - $t2;
                        b next_2              #                 // goto next_2
                                              #             }
                                              #             else {
alt_1:          nop                           # alt_1:          ; 
                        print_di(0)           #                 mips.print_di(0);
                        b next_2              #                 // goto next_2
                                              #             }
next_2:         nop                           # next_2:     ;            
                    subi $t1, $t1, 1          #             $t1--;
                    beq $t1, 0, done_2        #             if($t1 == 0) break; // goto done_2
                    b loop_2
                                              #         }
done_2:         nop                           # done_2: ;        
                    print_di('\n')            #         mips.print_ci('\n');
                ###############################
                # Marshal return value
                li $v0, 0
                # Restore S registers
                pop_s_registers()
                jr $ra                        #         return 0;
                                              # }