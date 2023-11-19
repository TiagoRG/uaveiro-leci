        .eqv SIZE,20
        
        .data
str:    .space  21

        .text
        .globl main

# Mapa de registos
# num:      $t0
# i:        $t1
# str:      $t2
# str+i:    $t3
# str[i]:   $t4

main:   la      $a0,str
        li      $a1,SIZE
        li      $v0,8
        syscall                 # read_string(str,SIZE)
        li      $t0,0           # num = 0
        li      $t1,0           # i = 0

while:  la      $t2,str         # $t2=&str[0] <=> $t2=str
        addu    $t3,$t2,$t1     # $t3=&str[i] <=> $t3=str+i
        lb      $t4,0($t3)      # $t4=str[i]
        beq     $t4,'\0',endw   # if (str[i]=='\0') goto endw

if:     blt     $t4,'0',endif
        bgt     $t4,'9',endif
        addi    $t0,$t0,1       # num++

endif:  addi    $t1,$t1,1       # i++
        j       while

endw:   move    $a0,$t0
        li      $v0,1
        syscall

        jr      $ra
