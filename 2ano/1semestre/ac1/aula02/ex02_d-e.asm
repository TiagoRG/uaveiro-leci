	.data
	.text
	.globl main
main:   li	$a0,0x1010
	li	$v0,1
	syscall
	
	jr 	$ra