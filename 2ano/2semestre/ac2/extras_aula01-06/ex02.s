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

	.equ	ADDR_BASE, 0xBF88
	.equ	TRISE, 0x6100
	.equ	LATE,  0x6120

	.data
	.text
	.globl main

main:
	lui	$t7, ADDR_BASE
	
	lw	$t0, TRISE($t7)
	andi	$t0, $t0, 0xFFF0
	sw	$t0, TRISE($t7)

	lw	$t0, LATE($t7)
	andi	$t0, $t0, 0xFFF0
	sw	$t0, LATE($t7)

loop:
	li	$v0, INKEY
	syscall
	move	$t0, $v0
	beq	$t0, 0, loop

	beq	$t0, '0', sw_0
	beq	$t0, '1', sw_1
	beq	$t0, '2', sw_2
	beq	$t0, '3', sw_3

	lw	$t0, LATE($t7)
	andi	$t0, $t0, 0xFFF0
	ori	$t0, $t0, 0x000F
	sw	$t0, LATE($t7)

	li	$a0, 1000
	move	$s0, $ra
	jal	delay
	move	$ra, $s0

	lw	$t0, LATE($t7)
	andi	$t0, $t0, 0xFFF0
	sw	$t0, LATE($t7)

	j	end

sw_0:
	lw	$t0, LATE($t7)
	andi	$t0, $t0, 0xFFF0
	ori	$t0, $t0, 0x0001
	sw	$t0, LATE($t7)
	j	end

sw_1:
	lw	$t0, LATE($t7)
	andi	$t0, $t0, 0xFFF0
	ori	$t0, $t0, 0x0002
	sw	$t0, LATE($t7)
	j	end

sw_2:
	lw	$t0, LATE($t7)
	andi	$t0, $t0, 0xFFF0
	ori	$t0, $t0, 0x0004
	sw	$t0, LATE($t7)
	j	end

sw_3:
	lw	$t0, LATE($t7)
	andi	$t0, $t0, 0xFFF0
	ori	$t0, $t0, 0x0008
	sw	$t0, LATE($t7)
	j	end

end:
	j	loop
	jr	$ra

delay:
	mul	$t0, $a0, 20000
	li	$v0, RESET_CORE_TIMER
	syscall

delay_loop:
	li	$v0, READ_CORE_TIMER
	syscall
	move	$t1, $v0
	blt	$t1, $t0, delay_loop
	jr	$ra
