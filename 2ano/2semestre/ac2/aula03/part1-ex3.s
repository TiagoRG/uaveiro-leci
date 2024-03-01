	.equ	ADDR_BASE, 0xBF88
	.equ	TRISD, 0x60C0
	.equ	PORTD, 0x60D0
	.equ	TRISE, 0x6100
	.equ	LATE,  0x6120

	.data
	.text
	.globl main

main:
	lui	$t7, ADDR_BASE

	lw	$t0, TRISD($t7)
	ori	$t0, $t0, 0x0100		# 0000 0001 0000 0000 (isola bit 8)
	sw	$t0, TRISD($t7)			# Configurar RD8 como input

	lw	$t0, TRISE($t7)
	andi	$t0, $t0, 0xFFFE		# 1111 1111 1111 1110 (isola bit 0)
	sw	$t0, TRISE($t7)			# Configurar RE0 como output

loop:
	lw	$t0, PORTD($t7)
	andi	$t0, $t0, 0x0100		# 0000 0001 0000 0000 (isola bit 8)
	srl	$t0, $t0, 8			# Necessário colocar o bit lido na posição do bit 0
	xori	$t0, $t0, 0xFFFF		# Negar RD8
	lw	$t1, LATE($t7)
	andi	$t1, $t1, 0xFFFE		# 1111 1111 1111 1110 (isola bit 0)

	or	$t1, $t1, $t0
	sw	$t1, LATE($t7)
	j	loop

	jr	$ra
