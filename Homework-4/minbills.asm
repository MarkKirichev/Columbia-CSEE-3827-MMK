.data:
totalvalue: 50

main:
        li      $a0, 0
        jal     minbills
        move    $a0, $v0
        li      $v0, 1
        syscall
        li      $v0, 10
        syscall

minbills:
        li      $s0, 0                   # count = 0
        li      $s1, totalvalue          # totalvalue = input data

for:
        beq     $s1, 0, return

        slt     $s1, 10, 1       
	addi    $s0, 1,  0
        subi    $s1, -10

        slt     $s1,5, 1
        addi    $s0, 1, 0
        subi    $s1, -5
 
        slt     $s1, 1, 1
        addi    $s0, 1, 0
        subi    $s1, -1        

        move    $s0, $s1        # x = y
        add     $s1, $t0, $s1   # y = z + y   or the shorthand version: y += z

        j       for

return:
        move    $v0, $s0
        jr      $ra
(base) markkirichev@Marks
