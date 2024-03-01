	.equ READ_CORE_TIMER, 11
	.equ RESET_CORE_TIMER, 12
	.equ PUT_CHAR, 3
	.equ PRINT_INT, 6

	.data
	.text
	.globl main

main:	li	$t0, 0

while:	li	$a0, '\r'
	li	$v0, PUT_CHAR
	syscall

	move	$a0, $t0
	li	$a1, 4
	sll	$a1, $a1, 16
	ori	$a1, $a1, 10
	li	$v0, PRINT_INT
	syscall

	li	$v0, RESET_CORE_TIMER
	syscall

delay:	li	$v0, READ_CORE_TIMER
	syscall
	move	$t1, $v0

	# 20,000,000 cycles = 1 second = 1 Hz
	# 4,000,000 cycles = 0.2 second = 5 Hz
	# 2,000,000 cycles = 0.1 second = 10 Hz
	blt	$t1, 20000000, delay

	addi	$t0, $t0, 1
	j	while

