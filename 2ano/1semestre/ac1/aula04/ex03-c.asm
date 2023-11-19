	.data
	.eqv SIZE, 4
	.eqv print_int10, 1
array:	.word 7692, 23, 5, 234

	.text
	.globl main

# Mapa de registos
# $t0:		i
# $t1:		soma
# $t2:		array
# $t3:		array[i]

main:	li	$t1, 0			# int soma = 0;
	li	$t0, 0			# int i = 0;
	la	$t2, array

while:	bge	$t0, SIZE, endw		# while (i < SIZE) {
	
	sll	$t4, $t0, 2
	addu	$t3, $t2, $t4
	lw	$t3, 0($t3)

	add	$t1, $t1, $t3

	addi	$t0, $t0, 1
	j while

endw:	li	$v0, print_int10
	move	$a0, $t1
	syscall

	jr	$ra
