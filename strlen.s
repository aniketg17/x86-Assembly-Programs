.text


.globl len

len: pushq %rbp
     movq  %rsp , %rbp
     movq %rdi , %r8  #r8 is the char *
     movq $0 , %r11   # counter

while: movq %r8 , %rdx

       cmpb $0 , (%rdx)
       jle  end

       addq $1 , %r11

       movq %r8 , %r9
       addq $1 , %r9   #incrementing counter
       movq %r9 , %r8

       jmp while
end:
       movq %r11 , %rax
       leave
       ret
