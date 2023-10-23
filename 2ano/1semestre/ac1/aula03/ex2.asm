        .data
str1:   .asciiz "Introduza um numero: "
str2:   .asciiz "O numero em binario e: "
        .eqv print_string, 4
        .eqv read_int, 5
        .eqv print_int, 1
        .text
        .globl main

# Mapa de registos:
# valor: $t0
# bit: $t1
# i: $t2
# flag: $t4

main:	la      $a0, str1
        li      $v0, print_string
        syscall                             # Imprime a mensagem "Introduza um numero: "

        li      $v0, read_int
        syscall                             # Le o numero introduzido pelo utilizador
        move    $t0, $v0                    # Guarda o numero introduzido em $t0

        li      $v0, print_string
        la      $a0, str2
        syscall                             # Imprime a mensagem "O numero em binario e: "

        li      $t2, 0                      # Inicializa o contador i a 0

for:    bge     $t2, 32, endfor             # Se i >= 32, termina o ciclo
	li	$t3,0x80000000
        and 	$t1, $t0, $t3		    # bit = valor & 0x80000000
	beq	$t4, 0, if1_2
	beq	$t4, 1, if2

if1_2:	beq	$t1, 0, endif1

if2:    li	$t4, 1			    # flag = 1;
	beq     $t1, 0, else2               # Se bit == 0, salta para else
        li      $a0, 1                      # Caso contrario, imprime 1
        j       endif2

else2:  li      $a0, 0                      # Imprime 0

endif2: li      $v0, print_int
        syscall                             # Imprime o valor de a0
        
endif1:	sll     $t0, $t0, 1                 # valor = valor << 1

        addi    $t2,$t2,1                   # i+=1
        j       for
endfor: jr      $ra                         # Salta para o endereco de retorno
