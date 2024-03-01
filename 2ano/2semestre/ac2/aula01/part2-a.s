	.equ	GET_CHAR, 2
	.equ	PUT_CHAT, 3
	.equ	PRINT_INT, 6
	.equ	PRINT_STR, 8
	.data
	
	.text
	.globl main

# Mapa de registos
# $t0:	cnt
# $t1:	c

main:	li	$t0, 0
	
do:					# do {
	li	$v0, GET_CHAR
	syscall
	move	$t1, $v0		# c = getChar();

	li	$v0, PUT_CHAT
	addi	$a0, $t1, 0
	syscall				# putChar(c);

	addi	$t0, 1			# cnt++;

	bne	$t1, '\n', do		# } while (c != '\n');

fi:	li	$v0, PRINT_INT
	move	$a0, $t0
	li	$a1, 10
	syscall

	li	$v0, 0
	jr	$ra
