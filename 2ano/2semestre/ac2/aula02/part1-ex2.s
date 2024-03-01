	.equ READ_CORE_TIMER, 11
	.equ RESET_CORE_TIMER, 12
	.equ PUT_CHAR, 3
	.equ PRINT_INT, 6

	.data
	.text
	.globl main

main:	li	$s0, 0

while:	li	$a0, '\r'
	li	$v0, PUT_CHAR
	syscall

	move	$a0, $s0
	li	$a1, 4
	sll	$a1, $a1, 16
	ori	$a1, $a1, 10
	li	$v0, PRINT_INT
	syscall

	addu	$sp, $sp, -4
	sw	$ra, 0($sp)
	li	$a0, 1000
	jal	delay

	addi	$s0, $s0, 1
	j	while

delay:	li	$v0, RESET_CORE_TIMER
	syscall

count:	li	$v0, READ_CORE_TIMER
	syscall
	mul	$t0, $a0, 20000
	blt	$v0, $t0, count

	jr	$ra
