.text

.globl bubblesort

bubblesort:                                        #void bubblesort {
            pushq %rbp
            movq  %rsp , %rbp

            subq $24 , %rsp

            movq  $1 , -8(%rbp)                        #int counter = 1;
            movq  $1 , -16(%rbp)                       #int flag = 1;
            movq  %rdi , -24(%rbp)                     #int number = n;


                                                       #repeat (flag) {
while:      cmpq  -8(%rbp) , %rdi                         # while (n > counter) {
            jle   exit_inner


if:         movq  -8(%rbp) , %rax                               #int ith = nums[i];
            imulq   $8 , %rax
            addq    %rsi , %rax

            movq   -8(%rbp) , %rcx
            imulq   $8 , %rcx
            addq    %rsi , %rcx
            subq   $8 , %rcx
            movq   (%rcx) , %r8                                 #int comp = nums[i-1];

            cmpq   (%rax) , %r8                                 #if (comp > ith) {
            jle     increment

swap:
            movq  (%rax) , %r9
            movq  (%rcx) , %r8
            movq  %r8 , (%rax)
            movq  %r9 , (%rcx)
            movq  $0 , -16(%rbp) #mark the flag                           #swap (i-1, i);
                                                                          #flag = 0;
                                                                 #}


increment:  addq  $1 , -8(%rbp)                                  #counter++;
            jmp while                                      #}

exit_inner: cmpq  $1 , -16(%rbp)
            movq  $1, -16(%rbp)                       #flag = 1;
            movq  $1, -8(%rbp)                        #counter = 1;
            jl   while                               #}

exit:
            leave
            ret
