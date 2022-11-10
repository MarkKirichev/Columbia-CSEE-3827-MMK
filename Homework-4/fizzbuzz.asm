.data
fizz: .asciiz "Fizz"
buzz: .asciiz "Buzz"
line: .asciiz "\n"

.text

main:
    # loading initial variable in the t-registers since all of them are temporary
    li $t0, 0 
    li $t1, 101 # some random, arbitrary starting number
    li $t2, 3
    li $t3, 5
    li $t5, 0

    addi $sp, $sp, -4
    sw   $ra, 0($sp)
    
    loop

loop:
    # $t0 mod 3
    div $t0, $t2
    mfhi $t4
    
    # if not equal to 0: *goto check5*
    bgtz $t4, check5
    
    # set matched flag
    li $t5, 1
    
    # print "Fizz"
    li $v0, 4
    la $a0, print_fizz
    syscall
    
check5:
    # t0 mod 5
    div $t0, $t3
    mfhi $t4
    
    # if not equal to 0: *goto check_neither*
    bgtz $t4, check_neither
    
    # set matched flag
    li $t5, 1
    # print "Buzz"
    
    li $v0, 4
    la $a0, print_buzz
    syscall

check_neither:
    # check if we've matched yet
    bgtz $t5, newline
    
    # print integer
    li $v0, 1
    ori $a0, $t0, 0
    syscall
    
newline:
    # print the newline character "\n"
    li $v0, 4
    la $a0, line
    syscall
    
    # Exit if our iteration variable == 101
    li $t5, 0
    addi $t0, $t0, 1
    bne $t0, $t1, loop

return_from_fizzbuzz:
    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra
