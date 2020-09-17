# Define global variable a in data section

      .data
      .comm     a, 8        # long a;

      .text

format1:
      .string "a="
format2:
      .string "%ld"
format3:
      .string "a^2 is %ld\n"

.globl main
main:                       # main()
      pushq %rbp            #save frame pointer
      movq  %rsp , %rbp

      movq $format1 , %rdi
      movq $0 , %rax
      call printf

      movq $format2, %rdi
      movq $a , %rsi
      movq $0 , %rax
      call scanf

      movq $format3 , %rdi
      movq $a , %rsi
      movq (%rsi) , %rsi
      imulq %rsi , %rsi
      movq $0 , %rax
      call printf

      leave
      ret

