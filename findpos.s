.text

.globl find_pos

find_pos: pushq %rbp
          movq %rsp , %rbp

          subq $8, %rsp
          movq $-1 , %rax
          movq $0 , -8(%rbp) #counter

while:    cmpq -8(%rbp) , %rdi
          jle  end

          movq (%rsi) , %r9
          cmpq %r9 , %rdx
          je   index


          movq -8(%rbp) , %r8
          addq $1 , %r8
          movq %r8 , -8(%rbp)

          addq $8 , %rsi

          jmp while

index:    movq -8(%rbp) , %rax

end:      leave
          ret
