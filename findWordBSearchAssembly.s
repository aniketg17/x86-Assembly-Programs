.text

.globl findWordBSearchAssembly

findWordBSearchAssembly: pushq %rbp
                         movq %rsp , %rbp

                         subq $40 , %rsp

                         movq $0 , -8(%rbp)   #low         (char *word,char **array, long nwrods)
                         movq %rdx , -16(%rbp)  #high
                         subq $1 , -16(%rbp)   # n-1

                         movq $0 , -24(%rbp)  #med
                         movq %rdi , -32(%rbp)  #storing needle
                         movq %rsi , -40(%rbp)  # storing haystack

                         pushq %r12
                         pushq %r13

loop:                    movq -8(%rbp) , %r8
                         cmpq -16(%rbp) , %r8
                         movq $-1 , %rax
                         jg   exit

                         movq $0 , %rdx
                         movq -8(%rbp) , %rax
                         addq -16(%rbp) , %rax
                         movq $2 , %r9
                         idivq %r9
                         movq %rax , %r12
                         movq %rax , -24(%rbp)

                         imulq $8 , %r12
                         addq -40(%rbp) , %r12

                         movq (%r12) , %rsi
                         movq -32(%rbp) , %rdi
                         call strcasecmp            #strcasecmp(word , array[mid);

                         cmp  $0 , %eax
                         je   found
                         jl   left_half

right_half:              movq -24(%rbp) , %r8
                         addq $1 , %r8
                         movq %r8 , -8(%rbp)

                         jmp  loop

left_half:               movq -24(%rbp) , %r8
                         subq $1 , %r8
                         movq %r8 , -16(%rbp)

re_enter:                jmp  loop

found:                   movq -24(%rbp) , %rax

exit:                    popq %r13
                         popq %r12
                         leave
                         ret
