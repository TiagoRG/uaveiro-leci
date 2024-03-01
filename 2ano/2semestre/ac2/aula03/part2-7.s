	.equ	ADDR_BASE, 0xBF88
	.equ	TRISB, 0x6040
	.equ	PORTB, 0x6050
	.equ	TRISE, 0x6100
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

	lw	$t0, TRISB($t7)
	ori	$t0, $t0, 0x0004		# 0000 0000 0000 0010 (isola bit 1)
	sw	$t0, TRISB($t7)			# Configura RB1 como input

	li	$t0, 0x0010			# Iniciar contagem

loop:
	lw	$t1, LATE($t7)
	andi	$t1, $t1, 0xFFE1		# 1111 1111 1110 0001 (reset bits 4-1)
	sll	$t2, $t0, 1			# shift do contador para os bits 4-1
	or	$t1, $t1, $t2			# merge contador com valor do LATE
	sw	$t1, LATE($t7)			# atualiza valor do LATE

	li	$v0, RESET_CORE_TIMER
	syscall

delay:
	li	$v0, READ_CORE_TIMER
	syscall
	move	$t2, $v0

	blt	$t2, 13333333, delay

switch_check:
	lw	$t2, PORTB($t7)
	andi	$t2, $t2, 0x0004		# 0000 0000 0000 0100 (isola bit 3)
	beqz	$t2, move_right			# switch3 = 0: move_right, switch3 = 1: move_left

move_left:
	andi	$t1, $t1, 0x0010		# isolar bit 4
	srl	$t1, $t1, 4			# colocar bit na posição menos significativa para o contador
	xori	$t1, $t1, 0x0001                # negar bit
	sll	$t0, $t0, 1                     # shift left do contador

	j	switch_end

move_right:
	andi	$t1, $t1, 0x0002		# isolar bit 1
	sll	$t1, $t1, 2                     # colocar bit na posição mais significativa para o contador
	xori	$t1, $t1, 0x0008                # negar bit
	srl	$t0, $t0, 1                     # shift right do contador

switch_end:
	or	$t0, $t0, $t1			# colocar bit lido no contador
	j	loop

