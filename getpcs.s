.text

.globl getpcs

getpcs:   pushq %rbp
          movq %rsp, %rbp

          movq %rbp , %r8    #%r8 is the FP
          movq $0 , %r9  #counter = %r9 = 0


loop:     cmpq %rdi , %r9
          je   leave

          cmpq (%r8), %r8
          jg   leave

          movq (%r8), %rcx
          subq %r8, %rcx
          cmpq $4096, %rcx
          jg   leave

          movq %r8, %r11
          addq $8, %r11
          movq (%r11), %r11    #using frame pointer here to get PC

          movq %r9, %rcx       #getting array index
          imulq $8 , %rcx
          addq %rsi, %rcx

          movq %r11 ,(%rcx)

          movq (%r8), %r8

          addq $1, %r9

          jmp loop



leave:    movq %r9, %rax
          leave
          ret
