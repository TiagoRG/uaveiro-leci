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
	ori	$t0, $t0, 0x0001		# 0000 0000 0000 0001 (isola bit 0)
	sw	$t0, TRISB($t7)			# Configurar RB0 como input

	lw	$t0, TRISE($t7)
	andi	$t0, $t0, 0xFFFE		# 1111 1111 1111 1110 (isola bit 0)
	sw	$t0, TRISE($t7)			# Configurar RE0 como output

loop:
	lw	$t0, PORTB($t7)
	andi	$t0, $t0, 0x0001		# 0000 0000 0000 0001 (isola bit 0)
	xori	$t0, $t0, 0x0001		# Negar RB0
	lw	$t1, LATE($t7)
	andi	$t1, $t1, 0xFFFE		# 1111 1111 1111 1110 (isola bit 0)

	or	$t1, $t1, $t0
	sw	$t1, LATE($t7)
	j	loop

	jr	$ra
