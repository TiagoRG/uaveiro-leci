	.equ INKEY, 1
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
# factor:	$s3

main:	li	$s0, 0
	li	$s1, 0
	li	$s2, 0
	li	$s3, 100

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

	li	$v0, INKEY
	syscall
	move	$t0, $v0
	beq	$t0, 'A', increase_speed
	beq	$t0, 'N', decrease_speed
	beq	$t0, 'S', suspend
	j	continue

increase_speed:
	div	$s3, $s3, 2
	j	continue
decrease_speed:
	li	$s3, 100
	j	continue
suspend:
	li	$v0, INKEY
	syscall
	beq	$v0, 'R', continue
	j	suspend
continue:
	addu	$sp, $sp, -4
	sw	$ra, 0($sp)
	move	$a0, $s3
	jal	delay

	rem	$t0, $s2, 10
	bnez	$t0, ignore1
	addi	$s0, $s0, 1

ignore1:
	rem	$t0, $s2, 2
	bnez	$t0, ignore5
	addi	$s1, $s1, 1

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
