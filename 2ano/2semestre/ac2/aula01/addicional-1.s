	.equ	INKEY, 1
	.equ	GETCHAR, 2
	.equ	PUTCHAR, 3
	.equ	READ_INT, 4
	.equ	READ_INT10, 5
	.equ	PRINT_INT, 6
	.equ	PRINT_INT10, 7
	.equ	PRINT_STR, 8
	.equ	READ_STR, 9
	.equ	EXIT, 10
	.equ	READ_CORE_TIMER, 11
	.equ	RESET_CORE_TIMER, 12

	.equ	UP, 1
	.equ	DOWN, 0

	.data
	.text
	.globl main

# Mapa de registos
# $t0	→ state
# $t1	→ cnt
# $t2	→ c

main:
	li	$t0, 0
	li	$t1, 0

do:
	li	$a0, '\r'
	li	$v0, PUTCHAR
	syscall

	move	$a0, $t1
	li	$a1, 3
	sll	$a1, $a1, 16
	ori	$a1, $a1, 10
	li	$v0, PRINT_INT
	syscall

	li	$a0, '\t'
	li	$v0, PUTCHAR
	syscall

	move	$a0, $t1
	li	$a1, 8
	sll	$a1, $a1, 16
	ori	$a1, $a1, 2
	li	$v0, PRINT_INT
	syscall

	addi	$sp, $sp, -16
	sw	$ra, 0($sp)
	sw	$t0, 4($sp)
	sw	$t1, 8($sp)
	sw	$t2, 12($sp)
	li	$a0, 5
	jal	wait
	lw	$ra, 0($sp)
	lw	$t0, 4($sp)
	lw	$t1, 8($sp)
	lw	$t2, 12($sp)
	addi	$sp, $sp, 16
	
	li	$v0, INKEY
	syscall
	move	$t2, $v0

	beq	$t2, '+', if_plus
	beq	$t2, '-', if_minus
	beq	$t2, 'S', if_stop
	j	if
if_plus:
	li	$t0, UP
	j	if
if_minus:
	li	$t0, DOWN
	j	if
if_stop:
	li	$v0, INKEY
	syscall
	move	$t2, $v0
	bne	$t2, 'R', if_stop

if:
	bne	$t0, UP, else
	addi	$t1, $t1, 1
	andi	$t1, $t1, 0xFF
	j	endif
else:
	addi	$t1, $t1, -1
	andi	$t1, $t1, 0xFF
endif:
	bne	$t2, 'q', do
	jr	$ra


wait:
	li	$t0, 0
	mul	$t1, $a0, 515000
wait_loop:
	bge	$t0, $t1, wait_return
	addi	$t0, $t0, 1
	j	wait_loop
wait_return:
	jr	$ra
