.data
  .comm num,8
  .comm inp, 8

.text
question:
    .string "N? "
int_out:
    .string "%ld"
sum_print:
    .string "SUM=%ld\n"
avg_print:
    .string "AVG=%ld\n"

.globl main
main:                           #int main()
    pushq    %rbp               #saving frame pointer
    movq     %rsp , %rbp        #changing base pointer

    subq     $16 , %rsp

    movq     $0 , -8(%rbp)     # int total = 0;
    movq     $0 , -16(%rbp)    # int counter = 0;

    movq     $question , %rdi   #printf("N? ");
    movq     $0 , %rax
    call     printf

    movq     $int_out , %rdi    #scanf("ld", num);
    movq     $num , %rsi
    movq     $0 , %rax
    call     scanf

    movq     $0 , -16(%rbp)      #counter = 0;

while:                            #while (temp <= counter) {

    movq     $num , %rcx
    movq     (%rcx) , %rcx        #int temp = num;

    cmpq     -16(%rbp) , %rcx
    jle      afterw

    addq     $1, -16(%rbp)        #counter++;

    movq     $int_out , %rdi       #scanf("ld", inp);
    movq     $0 , %rax
    movq     $inp , %rsi
    call     scanf

    movq     -8(%rbp) , %rax    # int temp2 = total;
    movq     inp , %rcx          # temp = inp
    addq     %rcx , %rax         # temp += temp2
    movq     %rax , -8(%rbp)     # total = temp

    jmp      while                #repeat

afterw:
    movq     $sum_print, %rdi     #printf("SUM=%ld", total);
    movq     -8(%rbp) , %rsi
    movq     $0 , %rax
    call     printf

    cmpq    $0 , -8(%rbp)       # if (total <= 0) return;
    jle     exit

    movq    -8(%rbp) , %rax      #int avg = total / num;
    movq    $0 , %rdx
    movq    $num , %rcx
    movq    (%rcx), %rcx
    idivq   %rcx

    movq    $avg_print , %rdi     #printf("AVG=%ld", avg);
    movq    %rax , %rsi
    movq    $0 , %rax
    call    printf

exit:     leave
          ret
