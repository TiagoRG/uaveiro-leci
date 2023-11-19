	.data
	.eqv SIZE, 20
	.eqv print_string, 4
	.eqv read_string, 8
str:	.space 21
str1:	.asciiz "Introduza uma string: "

	.text
	.globl main

# Mapa de registos
# $t0:		p
# $t1:		*p

main:	li 	$v0, print_string
	la	$a0, str1
	syscall				# print_string("Introduza uma string: ");
	
	la	$a0, str
	li	$a1, SIZE
	li	$v0, read_string
	syscall				# read_string(str, SIZE);

# --- CONVERTER PARA MAIÚSCULAS ---

	la	$t0, str		# p = str;

while1:	lb	$t1, 0($t0)	
	beq	$t1, 0x00, endw1	# while (*p != '\0') {

if1:	blt	$t1, 0x61, else1	# if (*p >= 'a')
	bgt	$t1, 0x7A, else1	# if (*p <= 'z')

	addiu	$t1, $t1, -0x20		# *p = *p - 'a' + 'A';
	sb	$t1, 0($t0)

else1:	addiu	$t0, $t0, 1		# p++
	j	while1			# }

endw1:	li	$v0, print_string
	la	$a0, str
	syscall

# ---------------------------------

	li	$v0, 11
	li	$a0, '\n'
	syscall

# --- CONVERTER PARA MINÚSCULAS ---

	la	$t0, str		# p = str;

while2:	lb	$t1, 0($t0)	
	beq	$t1, 0x00, endw2	# while (*p != '\0') {

if2:	blt	$t1, 0x41, else2	# if (*p >= 'a')
	bgt	$t1, 0x5A, else2	# if (*p <= 'z')

	addiu	$t1, $t1, 0x20		# *p = *p - 'a' + 'A';
	sb	$t1, 0($t0)

else2:	addiu	$t0, $t0, 1		# p++
	j	while2			# }

endw2:	li	$v0, print_string
	la	$a0, str
	syscall

# ---------------------------------

	jr	$ra
