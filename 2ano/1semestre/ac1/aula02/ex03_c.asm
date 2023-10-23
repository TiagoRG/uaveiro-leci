	.data
str1:	.asciiz "Hello world"
	.eqv print_string,4
	
	.text
	.globl main
	
main:	la $a0,str1
	li $v0,print_string
	syscall
	
	jr $ra