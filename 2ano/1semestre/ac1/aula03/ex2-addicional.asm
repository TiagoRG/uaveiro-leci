	.data
str1:	.asciiz "Introduza dois numeros: "
str2:	.asciiz "Resultado: "
	.eqv print_int, 1
	.eqv print_string, 4
	.eqv read_int, 5
	.text
	.globl main

# Mapa de registos
# $t0: 		res
# $t1: 		mdor
# $t2: 		mdo
# $t3: 		i

main:	la	$a0, str1
	li	$v0, print_string
	syscall					# print_string("Introduza dois numeros: ");

	li	$v0, read_int
	syscall					# read_int()
	move	$t1, $v0			# mdor = read_int();
	andi	$t1, $t1, 0x0000FFFF		# mdor = mdor & 0x0000FFFF;

	li	$v0, read_int
	syscall					# read_int()
	move	$t2, $v0			# mdo = read_int();
	andi	$t2, $t2, 0x0000FFFF		# mdo = mdo & 0x0000FFFF;

	li	$t0, 0				# res = 0;
	li	$t3, 0				# i = 0;

while:	beq	$t1, 0, endw			# while (mdor != 0)
	bge	$t3, 16, endw			# while (i < 4) {

if:	andi	$t4, $t1, 0x00000001		# $t4 = mdor & 0x00000001;
	beq	$t4, 0, else

	add	$t0, $t0, $t2			# res = res + mdo;

else:	sll	$t2, $t2, 1			# mdo = mdo << 1;
	srl	$t1, $t1, 1			# mdor = mdor >> 1;

	addi	$t3, $t3, 1			# i++;
	j	while				# }

endw:	la	$a0, str2
	li	$v0, print_string
	syscall					# print_string("Resultado: ");

	li	$v0, print_int
	move	$a0, $t0			# print_int(res);
	syscall

	jr	$ra				# return
