	.data
	.text
	.globl	main

	.eqv	val_1, 0x5C1B
	.eqv	val_2, 0xA3E4

	.eqv	val_3, 0xE543
	
main:	# a), b)
	ori	$t0, $0, val_1
	ori	$t1, $0, val_2
	and	$t2, $t0, $t1
	or	$t3, $t0, $t1
	nor	$t4, $t0, $t1
	xor	$t5, $t0, $t1
	
	# c)
	ori	$t6, $0, val_3
	nor	$t7, $t6, $0
	
	jr	$ra
