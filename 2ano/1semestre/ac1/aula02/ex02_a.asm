        .data
        .text
        .globl main
        .eqv Imm, 0x00000001
main:   li $t0, 0x12345678
        
        sll $t2,$t0,Imm
        srl $t3,$t0,Imm
        sra $t4,$t0,Imm

        jr $ra
