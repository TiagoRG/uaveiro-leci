        .eqv SIZE,20
        
        .data
str:    .space  21

        .text
        .globl main

# Mapa de registos
# num:		$t0
# p:		$t1
# *p:		$t2

main:   la      $a0,str
        li      $a1,SIZE
        li      $v0,8
        syscall                 # read_string(str,SIZE)
        
	li      $t0,0           # num = 0
	la	$t1, str	# p = str


while:  lb	$t2, 0($t1)	# *p
	beq	$t2, '\0', endw # while (*p != '\0') {

if:	blt	$t2, '0', endif	# if (*p >= '0')
	bgt	$t2, '9', endif # if (*p <= '9')
	addi	$t0, $t0, 1	# num++;

endif:  addiu	$t1, $t1, 1	# p++;
	j 	while		# }
        

endw:   move    $a0,$t0
        li      $v0,1
        syscall

        jr      $ra
