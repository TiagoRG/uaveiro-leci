	.equ	ADDR_BASE, 0xBF88
	.equ	TRISB, 0x6040
	.equ	PORTB, 0x6050
	.equ	LATB,  0x6060
	.equ	TRISC, 0x6080
	.equ	PORTC, 0x6090
	.equ	LATC,  0x60A0
	.equ	TRISD, 0x60C0
	.equ	PORTD, 0x60D0
	.equ	LATD,  0x60E0
	.equ	TRISE, 0x6100
	.equ	PORTE, 0x6110
	.equ	LATE,  0x6120

	.equ	READ_CORE_TIMER, 11
	.equ	RESET_CORE_TIMER, 12

	.data
	.text
	.globl main

# Mapa de registos
# $t7:	endereço base periféricos
# $t0:	contador

main:
	lui	$t7, ADDR_BASE
	
	lw	$t0, TRISE($t7)
	andi	$t0, $t0, 0xFFE1		# 1111 1111 1110 0001 (isola bits 4-1)
	sw	$t0, TRISE($t7)			# Configura RE4-RE1 como output

	lw	$t1, TRISB($t7)
	ori	$t1, $t1, 0x0002		# 0000 0000 0000 0010 (isola bit 1)
	sw	$t1, TRISB($t7)			# Configura RB1 como input

	li	$t0, 0x0001			# Iniciar contagem

loop:
	lw	$t2, LATE($t7)
	andi	$t2, $t2, 0xFFE1		# 1111 1111 1110 0001 (reset bits 4-1)
	sll	$t3, $t0, 1			# shift do contador para os bits 4-1
	or	$t2, $t2, $t3			# merge contador com valor do LATE
	sw	$t2, LATE($t7)			# atualiza valor do LATE

	li	$v0, RESET_CORE_TIMER
	syscall

delay:
	li	$v0, READ_CORE_TIMER
	syscall
	move	$t6, $v0

	blt	$t6, 6666666, delay

switch_check:	
	lw	$t2, PORTB($t7)
	andi	$t2, $t2, 0x0002		# obtem posição do switch 1
	beqz	$t2, shift_right		# shift_left se bit = 1, shift_right de bit = 0

shift_left:
	sll	$t0, $t0, 1
	andi	$t5, $t0, 0x000F

	bnez	$t5, sll_else
	li	$t0, 0x0001
sll_else:
	j	switch_end

shift_right:
	srl	$t0, $t0, 1
	bnez	$t0, switch_end
	li	$t0, 0x0008

switch_end:
	j	loop

