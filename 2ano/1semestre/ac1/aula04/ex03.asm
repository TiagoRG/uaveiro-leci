	.data
	.eqv SIZE, 4
	.eqv print_int10, 1
array:	.word 7692, 23, 5, 234

	.text
	.globl main

# Mapa de registos
# $t0:		p
# $t1:		pultimo
# $t2:		*p
# $t3:		soma

main:	li	$t3, 0			# int soma = 0;
	
	la	$t0, array		# p = array;

	li	$t4, SIZE
	addi	$t4, $t4, -1
	sll	$t4, $t4, 2
	la	$t1, array		# pultimo = array;
	addu	$t1, $t1, $t4		# pultimo += size - 1;

while:	bgt	$t0, $t1, endw		# while (p <= pultimo) {
	lw	$t2, 0($t0)		# *p
	add	$t3, $t3, $t2		# soma += (*p);
	addiu	$t0, $t0, 4		# p++;
	j while

endw:	li	$v0, print_int10
	move	$a0, $t3
	syscall				# print_int10(soma);

	jr	$ra
