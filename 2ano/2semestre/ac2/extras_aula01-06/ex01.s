	.equ	ADDR_BASE, 0xBF88
	.equ	TRISB, 0x6040
	.equ	PORTB, 0x6050
	.equ	TRISE, 0x6100
	.equ	LATE,  0x6120

	.data
	.text
	.globl main

main:
	lui	$t7, ADDR_BASE
	
	lw	$t0, TRISB($t7)
	ori	$t0, $t0, 0x000F
	sw	$t0, TRISB($t7)

	lw	$t0, TRISE($t7)
	andi	$t0, $t0, 0xFF00
	sw	$t0, TRISE($t7)

loop:
	lw	$t0, PORTB($t7)
	andi	$t0, $t0, 0x000F

	move	$a0, $t0
	addi	$sp, $sp, -8
	sw	$ra, 0($sp)
	sw	$t0, 4($sp)
	jal	reverse_byte
	lw	$ra, 0($sp)
	lw	$t0, 4($sp)
	addi	$sp, $sp, 8
	or	$t0, $t0, $v0

	lw	$t1, LATE($t7)
	andi	$t1, $t1, 0xFF00
	or	$t1, $t1, $t0
	sw	$t1, LATE($t7)

	j	loop

	jr	$ra

reverse_byte:
	move	$v0, $a0

	andi	$t0, $v0, 0xF0
	srl	$t0, $t0, 4
	andi	$t1, $v0, 0x0F
	sll	$t1, $t1, 4
	or	$v0, $t0, $t1

	andi	$t0, $v0, 0xCC
	srl	$t0, $t0, 2
	andi	$t1, $v0, 0x33
	sll	$t1, $t1, 2
	or	$v0, $t0, $t1

	andi	$t0, $v0, 0xAA
	srl	$t0, $t0, 1
	andi	$t1, $v0, 0x55
	sll	$t1, $t1, 1
	or	$v0, $t0, $t1
	
	jr	$ra
