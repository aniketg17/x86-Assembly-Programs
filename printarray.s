.data
str1 : .string "%ld "

.text

.globl printArray

printArray: pushq %rbp
            movq %rsp, %rbp
            pushq %r13 #rdi  number of n
            pushq %r14 #rsi    array *
            pushq %r15  #iterator
            pushq %r15

            movq %rdi , %r13
            movq %rsi , %r14
            movq $0 , %r15

loop:       cmpq %r15, %r13
            jle  exit

            movq %r15 , %r8
            imulq $8 , %r8
            addq %r14, %r8
            movq $str1 , %rdi
            movq (%r8), %rsi
            movq $0 , %rax
            call printf

            addq $1, %r15

            jmp loop

exit:       popq %r15
            popq %r15
            popq %r14
            popq %r13
            leave
            ret
