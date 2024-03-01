	.equ	GET_CHAR, 2
	.equ	PUT_CHAT, 3
	.equ	READ_INT10, 5
	.equ	PRINT_INT, 6
	.equ	PRINT_INT10, 7
	.equ	PRINT_STR, 8
	.data

input:	.asciiz "\nIntroduza um inteiro (sinal e modulo): "
out_10: .asciiz "\nValor em base 10 (signed): "
out_2:	.asciiz "\nValor em base 2: "
out_16: .asciiz "\nValor em base 16: "
out_u10:
	.asciiz "\nValor em base 10 (unsigned): "
out_u10f:
	.asciiz "\nValor em base 10 (unsigned), formatado: "

	.text
	.globl main

main:	la	$a0, input
	li	$v0, PRINT_STR
	syscall				# printStr(input);

	li	$v0, READ_INT10
	syscall
	move	$t0, $v0		# value = readInt10();

	la	$a0, out_10
	li	$v0, PRINT_STR
	syscall				# printStr(10 signed);

	move	$a0, $t0
	li	$v0, PRINT_INT10
	syscall				# printInt10(value);

	la	$a0, out_10
	li	$v0, PRINT_STR
	syscall				# printStr(2);

	move	$a0, $t0
	li	$a1, 2
	li	$v0, PRINT_INT
	syscall				# printInt(value, 2);

	la	$a0, out_10
	li	$v0, PRINT_STR
	syscall				# printStr(16);

	move	$a0, $t0
	li	$a1, 16
	li	$v0, PRINT_INT
	syscall				# printInt(value, 16);

	la	$a0, out_10
	li	$v0, PRINT_STR
	syscall				# printStr(10 unsigned);

	move	$a0, $t0
	li	$a1, 10
	li	$v0, PRINT_INT
	syscall				# printInt(value, 10);

	la	$a0, out_u10f
	li	$v0, PRINT_STR
	syscall				# printStr(10 unsigned, formatado);

	move	$a0, $t0
	li	$a1, 5
	sll	$a1, $a1, 16
	ori	$a1, $a1, 5
	li	$v0, PRINT_INT
	syscall				# printInt(value, 10 | 5 << 16);

	j	main
