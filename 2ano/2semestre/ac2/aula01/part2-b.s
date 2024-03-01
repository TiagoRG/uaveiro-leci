	.equ	INKEY, 1
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
	li	$v0, INKEY
	syscall
	move	$t1, $v0		# c = inkey();

if:	beq	$t1, 0, fi		# if (c != 0) {
	move	$a0, $t1		# putchar(c);
	
fi:	li	$v0, PUT_CHAT
	syscall				# getchar();

	addi	$t0, 1			# cnt++;

	bne	$t1, '\n', do		# } while (c != '\n');

fi:	li	$v0, PRINT_INT
	move	$a0, $t0
	li	$a1, 10
	syscall

	li	$v0, 0
	jr	$ra
