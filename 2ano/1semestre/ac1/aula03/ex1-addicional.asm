	.data
str1:	.asciiz "Introduza um numero: "
str2:	.asciiz "\nValor em codigo gray: "
str3:	.asciiz "\nValor em binario: "
	.eqv print_int, 1
	.eqv print_string, 4
	.eqv read_int, 5
	.text
	.globl main

# Mapa de registos
# gray:	$t0
# bin:	$t1
# mask:	$t2

main:	li	$v0, print_string
	la	$a0, str1
	syscall				# print_string("Introduza um numero: ");

	li	$v0, read_int
	syscall				# read_int();
	move	$t0, $v0		# gray = read_int();

	srl	$t2, $t0, 1		# mask = gray >> 1;
	move	$t1, $t0		# bin = gray;

while:	beq	$t2, 0, done		# while (mask != 0) {
	
	xor	$t1, $t1, $t2		# bin = bin ^ mask;
	srl	$t2, $t2, 1		# mask = mask >> 1;

	j	while			# }

done:	
	li 	$v0, print_string
	la	$a0, str2
	syscall				# print_string("\nValor em codigo gray: ");
	
	li	$v0, print_int
	move	$a0, $t0
	syscall				# print_int(gray);

	li 	$v0, print_string
	la	$a0, str3
	syscall				# print_string("\nValor em binario: ");

	li	$v0, print_int
	move	$a0, $t1
	syscall				# print_int(bin);
	
	jr	$ra
