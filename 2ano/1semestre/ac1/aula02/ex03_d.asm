	.data
prompt:	.asciiz "Introduza 2 numeros\n"
result:	.asciiz "A soma dos dois numeros e: "
	.eqv print_string,4
	.eqv read_int,5
	.eqv print_int10,1
	
	.text
	.globl main
	
main:	li 	$v0,print_string
	la 	$a0,prompt
	syscall
	
	li	$v0,read_int
	syscall
	move	$t0,$v0
	li	$v0,read_int
	syscall
	move	$t1,$v0
	add	$t2,$t1,$t0
	
	li	$v0,print_string
	la	$a0,result
	syscall

	li	$v0,print_int10
	move	$a0,$t2
	syscall
	
	jr $ra
