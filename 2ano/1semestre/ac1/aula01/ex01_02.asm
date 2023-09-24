	.data

	.text
	.globl main
main:	ori $t0,$0,4
	ori $t1,$0,8
	
	add $t6,$t0,$t0
	add $t6,$t6,$t1
	
	sub $t7,$t0,$t0
	sub $t7,$t7,$t1
	
	jr $ra