main:
        li      $a0, 0
        jal     ifib
        move    $a0, $v0
        li      $v0, 1
        syscall
        li      $v0, 10
        syscall

ifib:
        li      $s0, 0          # x = 0
        li      $s1, 1          # y = 1

for:
        beqz    $a0, return
        subi    $a0, $a0, 1

        move    $t0, $s0        # z = x
        move    $s0, $s1        # x = y
        add     $s1, $t0, $s1   # y = z + y   or the shorthand version: y += z

        j       for

return:
        move    $v0, $s0
        jr      $ra
