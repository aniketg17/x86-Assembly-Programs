.text

print_out:
  .string "this is num: %d\n"

print_left:
  .string "this is left half high: %d\n"

print_right:
  .string "this is right half low: %d\n"

print_word:
  .string "this is needle: %ld\n"

print_mid:
  .string "this is middle: %s\n"

.globl findWordBSearchAssemblyOptimized

findWordBSearchAssemblyOptimized:
                         pushq %rbp
                         movq %rsp , %rbp

                         pushq %r12  #haystack
                         pushq %r13  #low
                         pushq %r14  #high
                         pushq %r15  #med
                         pushq %rbx  #needle

                         movq $0 , %r13
                         movq %rdx , %r14  #high
                         subq $1 , %r14   # n-1
                         movq $0 , %r15
                         movq %rdi , %rbx
                         movq %rsi , %r12


loop:
                         cmpq %r14 , %r13
                         movq $-1 , %rax
                         jg   exit

                         movq $0 , %rdx
                         movq %r13 , %rax
                         addq %r14 , %rax
                         movq $2 , %r9
                         idivq %r9
                         movq %rax , %r8
                         movq %rax , %r15

                         imulq $8 , %r8
                         addq %r12 , %r8

                         movq (%r8) , %rsi
                         movq %rbx , %rdi
                         call strcasecmp            #strcasecmp(word , array[mid);

                         cmp  $0 , %eax
                         je   found
                         jl   left_half

right_half:              movq %r15 , %r8
                         addq $1 , %r8
                         movq %r8 , %r13

                         jmp  loop

left_half:               movq %r15 , %r8
                         subq $1 , %r8
                         movq %r8 , %r14

re_enter:                jmp  loop

found:                   movq %r15 , %rax

exit:                    popq %rbx
                         popq %r15
                         popq %r14
                         popq %r13
                         popq %r12
                         leave
                         ret
