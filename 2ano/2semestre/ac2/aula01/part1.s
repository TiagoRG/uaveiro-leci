	.equ	PRINT_STR, 8

	.data
msg:	.asciz	"AC2 - Aulas praticas\n"

	.text
	.globl	main

main:	la	$a0, msg
	li	$v0, PRINT_STR
	syscall				# printStr("AC2 - Aulas praticas\n");
	li	$v0, 0			# return 0;
	jr	$ra
