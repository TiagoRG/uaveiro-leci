	.equ	ADDR_BASE, 0xBF88
	.equ	TRISE, 0x6100
	.equ	LATE,  0x6120
	.equ	TRISD, 0x60C0
	.equ	LATD, 0x60E0

	.equ	READ_CORE_TIMER, 11
	.equ	RESET_CORE_TIMER, 12

	.data
	.text
	.globl main

main:
	lui	$t7, ADDR_BASE

	lw	$t0, TRISE($t7)
	andi	$t0, $t0, 0xFFFE
	sw	$t0, TRISE($t7)

	lw	$t0, TRISD($t7)
	andi	$t0, $t0, 0xFFFE
	sw	$t0, TRISD($t7)

	li	$t0, 0x0000

loop:
	lw	$t1, LATE($t7)
	andi	$t1, $t1, 0xFFFE
	or	$t1, $t1, $t0
	sw	$t1, LATE($t7)

	lw	$t1, LATD($t7)
	andi	$t1, $t1, 0xFFFE
	or	$t1, $t1, $t0
	sw	$t1, LATD($t7)

	addi	$sp, $sp, -8
	sw	$ra, 0($sp)
	sw	$t0, 4($sp)

	li	$a0, 500
	jal	delay
	
	lw	$ra, 0($sp)
	lw	$t0, 4($sp)
	addi	$sp, $sp, 8

	xori	$t0, $t0, 0x0001
	j	loop

# ----------- DELAY FUNCTION ------------

delay:	li	$v0, RESET_CORE_TIMER
	syscall

wait:	li	$v0, READ_CORE_TIMER
	syscall
	mul	$t0, $a0, 20000
	blt	$v0, $t0, wait

	jr	$ra
