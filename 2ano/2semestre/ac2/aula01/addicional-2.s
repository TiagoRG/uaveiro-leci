	.equ	INKEY, 1
	.equ	GETCHAR, 2
	.equ	PUTCHAR, 3
	.equ	READ_INT, 4
	.equ	READ_INT10, 5
	.equ	PRINT_INT, 6
	.equ	PRINT_INT10, 7
	.equ	PRINT_STR, 8
	.equ	READ_STR, 9
	.equ	EXIT, 10
	.equ	READ_CORE_TIMER, 11
	.equ	RESET_CORE_TIMER, 12

	.equ	SIZE, 20

	.data

input:	.asciiz "Introduza 2 strings:\n"
r_str:	.asciiz "Resultados:\n"
res1:	.asciiz "Str1 len: "
res2:	.asciiz "Str2 len: "
res3:	.asciiz "Str3 + Str2: "
res4:	.asciiz "Str1 == Str2: "

str1:	.space	21
str2:	.space	21
str3:	.space	41

	.text
	.globl main

main:
	move	$s0, $ra		# Save $ra

	la	$a0, input
	li	$v0, PRINT_STR
	syscall

	la	$a0, str1
	li	$a1, SIZE
	li	$v0, READ_STR
	syscall

	li	$a0, '\n'
	li	$v0, PUTCHAR
	syscall

	la	$a0, str2
	li	$a1, SIZE
	li	$v0, READ_STR
	syscall

	li	$a0, '\n'
	li	$v0, PUTCHAR
	syscall

	la	$a0, r_str
	li	$v0, PRINT_STR
	syscall

	la	$a0, res1
	li	$v0, PRINT_STR
	syscall

	la	$a0, str1
	jal	strlen
	move	$a0, $v0
	li	$a1, 10
	li	$v0, PRINT_INT
	syscall

	li	$a0, '\n'
	li	$v0, PUTCHAR
	syscall

	la	$a0, res2
	li	$v0, PRINT_STR
	syscall

	la	$a0, str2
	jal	strlen
	move	$a0, $v0
	li	$a1, 10
	li	$v0, PRINT_INT
	syscall

	li	$a0, '\n'
	li	$v0, PUTCHAR
	syscall

	la	$a0, str3
	la	$a1, str1
	jal	strcpy

	la	$a0, res3
	li	$v0, PRINT_STR
	syscall
	
	la	$a0, str3
	la	$a1, str2
	jal	strcat
	move	$a0, $v0
	li	$v0, PRINT_STR
	syscall

	li	$a0, '\n'
	li	$v0, PUTCHAR
	syscall

	la	$a0, res4
	li	$v0, PRINT_STR
	syscall

	la	$a0, str1
	la	$a1, str2
	jal	strcmp
	move	$a0, $v0
	li	$v0, PRINT_INT10
	syscall

	li	$a0, '\n'
	li	$v0, PUTCHAR
	syscall

	jr	$s0
	


#----------------------------------------------
# STRLEN
#----------------------------------------------
# Mapa de registos
# $a0	→ str
# $t0	→ len
# $t1	→ *str
strlen:
	li	$t0, 0
strlen_loop:
	lb	$t1, 0($a0)
	beq	$t1, 0, strlen_return
	addiu	$t0, $t0, 1
	addiu	$a0, $a0, 1
	j	strlen_loop
strlen_return:
	move	$v0, $t0
	jr	$ra
#----------------------------------------------

#----------------------------------------------
# STRCPY
#----------------------------------------------
# Mapa de registos
# $a0	→ dst
# $a1	→ src
# $t0	→ p
# $t1	→ *src
strcpy:
	move	$t0, $a0
strcpy_loop:
	lb	$t1, 0($a1)
	sb	$t1, 0($a0)
	beq	$t1, 0, strcpy_return
	addiu	$a0, $a0, 1
	addiu	$a1, $a1, 1
	j	strcpy_loop
strcpy_return:
	move	$v0, $t0
	jr	$ra
#----------------------------------------------

#----------------------------------------------
# STRCAT
#----------------------------------------------
# Mapa de registos
# $a0	→ dst
# $a1	→ src
# $t0	→ p
# $t1	→ *dst
strcat:
	move	$t0, $a0
strcat_loop:
	lb	$t1, 0($a0)
	beq	$t1, 0, strcat_return
	addiu	$a0, $a0, 1
	j	strcat_loop
strcat_return:
	addiu	$sp, $sp, -20
	sw	$ra, 0($sp)
	sw	$a0, 4($sp)
	sw	$a1, 8($sp)
	sw	$t0, 12($sp)
	sw	$t1, 16($sp)
	jal	strcpy
	lw	$ra, 0($sp)
	lw	$a0, 4($sp)
	lw	$a1, 8($sp)
	lw	$t0, 12($sp)
	lw	$t1, 16($sp)
	addiu	$sp, $sp, 20
	move	$v0, $t0
	jr	$ra
#----------------------------------------------

#----------------------------------------------
# STRCMP
#----------------------------------------------
# Mapa de registos
# $a0	→ str1
# $a1	→ str2
# $t0	→ *str1
# $t1	→ *str2
strcmp:
	lb	$t0, 0($a0)
	lb	$t1, 0($a1)
	bne	$t0, $t1, strcmp_return
	beq	$t0, 0, strcmp_return
	addiu	$a0, $a0, 1
	addiu	$a1, $a1, 1
	j	strcmp
strcmp_return:
	sub	$v0, $t0, $t1
	jr	$ra
#----------------------------------------------
