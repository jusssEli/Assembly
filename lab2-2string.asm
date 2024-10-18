.data
    prompt1: .asciiz "Enter string for Register 1: "
    prompt2: .asciiz "Enter string for Register 2: "
    result1: .asciiz "Post swap:\nFirst string: "
    result2: .asciiz "Second string: "
    buffer1: .space 100  # Space for first string
    buffer2: .space 100  # Space for second string

.text
main:
    # Prompt for first string
    li $v0, 4             # syscall for print string
    la $a0, prompt1
    syscall

    # Read first string
    li $v0, 8             # syscall for read string
    la $a0, buffer1
    li $a1, 100           # maximum size
    syscall

    # Prompt for second string
    li $v0, 4             # syscall for print string
    la $a0, prompt2
    syscall

    # Read second string
    li $v0, 8             # syscall for read string
    la $a0, buffer2
    li $a1, 100           # maximum size
    syscall

    # Swap 
    la $t0, buffer1       # buffer1 into $t0
    la $t1, buffer2       # buffer2 into $t1

    # Save buffer1 into temp
    move $t2, $t0         # address buffer1 to $t2
    move $t3, $t1         # address buffer2 to $t3

    # Swap the contents
    li $t4, 0             # index for swapping
swap_loop:
    lb $t5, 0($t2)        # Load byte from buffer1
    lb $t6, 0($t3)        # Load byte from buffer2
    sb $t6, 0($t2)        # Store byte from buffer2 into buffer1
    sb $t5, 0($t3)        # Store byte from buffer1 into buffer2

    # Move to the next byte
    addi $t2, $t2, 1      # Increment buffer1 pointer
    addi $t3, $t3, 1      # Increment buffer2 pointer
    addi $t4, $t4, 1      # Increment index
    
    # Check for null terminator
    lb $t7, -1($t2)       # Load byte at current buffer1 pointer (should be null terminator)
    beqz $t7, end_swap    # If it’s null terminator, end the loop
    j swap_loop

end_swap:
    # Print results after swapping
    li $v0, 4             # syscall for print string
    la $a0, result1
    syscall

    li $v0, 4             # syscall for print string
    la $a0, buffer1
    syscall

    li $v0, 4             # syscall for print string
    la $a0, result2
    syscall

    li $v0, 4             # syscall for print string
    la $a0, buffer2
    syscall

    # Exit the program
    li $v0, 10            # syscall for exit
    syscall