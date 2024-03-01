	.equ READ_CORE_TIMER, 11
	.equ RESET_CORE_TIMER, 12
	.equ PUT_CHAR, 3
	.equ PRINT_INT, 6

	.data
	.text
	.globl main

# Mapa de registos
# cnt1:		$s0
# cnt5:		$s1
# cnt10:	$s2

main:	li	$s0, 0
	li	$s1, 0
	li	$s2, 0

while:	li	$a0, '\r'
	li	$v0, PUT_CHAR
	syscall

	move	$a0, $s0
	li	$a1, 4
	sll	$a1, $a1, 16
	ori	$a1, $a1, 10
	li	$v0, PRINT_INT
	syscall

	li	$a0, '\t'
	li	$v0, PUT_CHAR
	syscall

	move	$a0, $s1
	li	$a1, 4
	sll	$a1, $a1, 16
	ori	$a1, $a1, 10
	li	$v0, PRINT_INT
	syscall

	li	$a0, '\t'
	li	$v0, PUT_CHAR
	syscall

	move	$a0, $s2
	li	$a1, 4
	sll	$a1, $a1, 16
	ori	$a1, $a1, 10
	li	$v0, PRINT_INT
	syscall

	addu	$sp, $sp, -4
	sw	$ra, 0($sp)
	li	$a0, 100
	jal	delay

	remi	$t0, $s0, 10
	bnez	$t0, ignore1
	addi	$s0, $s0, 1
	li	$s3, 0

ignore1:
	remi	$t0, $s1, 2
	bnez	$t0, ignore5
	addi	$s1, $s1, 1
	li	$s4, 0

ignore5:
	addi	$s2, $s2, 1
	j	while

delay:	li	$v0, RESET_CORE_TIMER
	syscall

count:	li	$v0, READ_CORE_TIMER
	syscall
	mul	$t0, $a0, 20000
	blt	$v0, $t0, count

	jr	$ra
