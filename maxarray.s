# maxarray.s
.text
.globl maxarray

maxarray:
          pushq %rbp
          movq %rsp , %rbp

          movq $0 , %rdx
          movq (%rsi), %rax

while:
          cmpq %rdx , %rdi
          jle afterw

          movq   %rdx , %rcx
          imulq  $8 , %rcx
          addq   %rsi , %rcx

          cmpq (%rcx) , %rax
          jge  afterif
          movq  (%rcx) , %rax

afterif : 
          addq  $1 , %rdx
          jmp while

afterw :  leave
          ret
