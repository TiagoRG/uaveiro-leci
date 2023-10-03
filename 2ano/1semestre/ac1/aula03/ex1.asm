        .data
str1:   .asciiz "Introduza um numero: "
str2:   .asciiz "Valor ignorado\n"
str3:   .asciiz "A soma dos positivos e: "
	.eqv print_string,4
	.eqv read_int,5
	.eqv print_int,1
        .text
        .globl main
# Mapa de registos:
# soma: $t0
# valor: $t1
# i: $t2
main:   li      $t2,0           # i=0
        li      $t0,0           # soma=0
for:    bge     $t2,5,endfor    # while (i<5) do {

        li      $v0,print_string
        la      $a0,str1
        syscall                 # printf("Introduza um numero: ")

        li      $v0,read_int
        syscall                 # scanf("%d",&valor)
        move    $t1,$v0         # valor=scanf("%d",&valor)

if:     ble     $t1,0,else      # if (valor<0) then {
        add     $t0,$t0,$t1     # soma+=valor
	    addi    $t2,$t2,1       # i+=1

        j       endif
else:   li      $v0,print_string
        la      $a0,str2
        syscall                 # printf("Valor ignorado\n")
endif:  j       for             # }

endfor: li      $v0,print_string
        la      $a0,str3
        syscall                 # printf("A soma dos positivos e: %d\n",soma")
        
        li      $v0,print_int
        move    $a0,$t0
        syscall                 # printf("%d\n",soma)

        jr      $ra             # }
