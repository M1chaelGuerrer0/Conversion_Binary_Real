# my code

        .text
        .include "macros/syscalls.s"
        .include "macros/stack.s"
        .globl whole2bin
whole2bin:  nop                                 # public static int whole2bin(int $a0) {
            # a0 : whole
            # t0 : whole
            # t1 : remainder
            # t2 : count
            # t3 : x

            # Save S registers
            push_s_registers()
            # Demarshal input arguments
            move $t0, $a0           #         $t0 = $a0;
            ######################### 
            li $t2, 0               #         $t2 = 0;
loop_1:     beq $t0, 0, done_1      # loop_1: for(; $t0 != 0;) {
body_1:         nop                 # body_1:     ;
                rem $t1, $t0, 2     #             $t1 = $t0 % 2;
                                    #
                div $t0, $t0, 2     #             $t0 = $t0 / 2;
                                    #
                push $t1            #             mips.push($t1);
next_1:         nop                 # next_1:     ;
                addi $t2, $t2, 1    #             $t2 = $t2 + 1;
                b loop_1            #             continue loop_1;
                                    #         }
done_1:     nop                     # done_1: ;
                                    # 
            li $t3, 0               #         $t3 = 0;
loop_2:     bge $t3, $t2, done_2    # loop_2: for(; $t3 < $t2;) {
body_2:         nop                 # body_2:     ;
                pop $t1             #             $t1 = mips.pop();
                print_d($t1)        #             mips.print_d($t1);
next_2:         nop                 # next_2:     ;
                addi $t3, $t3, 1    #             $t3 = $t3 + 1;
                b loop_2            #             continue loop_2;
                                    #         }
done_2:     nop                     # done_2: ;
            print_ci('\n')          #         mips.print_ci('\n');
            #########################
            # Marshal return value
            li $v0, 0
            # Restore S registers
            pop_s_registers()
            jr $ra                  #         return 0;
                                    # }