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

	lw	$t0, TRISE($t7)
	andi	$t0, $t0, 0xFFC3
	sw	$t0, TRISE($t7)

	lw	$t0, TRISB($t7)
	ori	$t0, $t0, 0x000F
	sw	$t0, TRISB($t7)

loop:
	lw	$t0, PORTB($t7)
	sll	$t0, $t0, 2
	sw	$t0, LATE($t7)

	j	loop
