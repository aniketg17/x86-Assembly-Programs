.text

.globl mystrcat

mystrcat: pushq %rbp
          movq %rsp, %rbp

          subq $40, %rsp
          movq %rdi , -8(%rbp) # s1
          movq %rsi , -16(%rbp) #s2
          movq %rdi , -40(%rbp)  # keep a copy of s2 to return later

          movq -8(%rbp) , %rdi
          call len
          movq %rax , -24(%rbp) # len of s1

          movq -16(%rbp) , %rdi
          call len
          movq %rax , -32(%rbp)  #len of s2

          movq -8(%rbp) , %r8
          movq -24(%rbp), %r9
          addq %r9 , %r8
          movq %r8 , -8(%rbp)

          movq $0 , %r8  # counter

loop:     cmpq -32(%rbp) , %r8 // comparing counter to length of s2
          jge  leave

          movq -16(%rbp) , %rcx
          movq -8(%rbp) , %r9
          movb (%rcx) , %r9b
          movq %r9 , -8(%rbp)

          movq $1 , %r9
          movq -16(%rbp) , %rdx
          addq %rdx , %r9
          movq %r9 , -16(%rbp)

          movq $1 , %r9
          movq -8(%rbp) , %rdx
          addq %rdx , %r9
          movq %r9 , -8(%rbp)

          addq $1, %r8

          jmp  loop

leave:    movq -40(%rbp) , %rax

          leave
          ret



