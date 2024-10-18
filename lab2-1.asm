#Elijah Rogers 10/6/2024

            .data      # data segment
outpPrompt: .asciiz  "Please enter an integer: "
	    .align 2   # align next prompt on a word boundary
outpStr:    .asciiz  "The value of X is: "
            .align 2   # align users input on a word boundary

            .text      # code section begins
            .globl	main 
main:  

# Prompt user for W input
	 la $a0, outpPrompt
	 li $v0, 4
	 syscall

# Read the user's integer value for W
	li $v0, 5
	syscall
	move $t0, $v0     # move first input to $t0 (w)

# Prompt user for X input
	 la $a0, outpPrompt
	 li $v0, 4
	 syscall

# Read the user's integer value for X
	li $v0, 5
	syscall
	move $t1, $v0     # move second input to $t1 (x)

# Prompt user for Y input
	 la $a0, outpPrompt
	 li $v0, 4
	 syscall

# Read the user's integer value for Y
	li $v0, 5
	syscall
	move $t2, $v0     # move third input to $t2 (y)

# Prompt user for Z input
	 la $a0, outpPrompt
	 li $v0, 4
	 syscall

# Read the user's integer value for Z
	li $v0, 5
	syscall
	move $t3, $v0     # move fourth input to $t3 (z)

# Perform the operations
	sub $t4, $t1, $t2  # Calculate x - y
	bge $t4, $t0, SetXtoY  # if (x - y) >= w then branch to SetXtoY

# Else case: Set x to z
	SetXtoZ:
	move $t1, $t3      # set x to z
	j PrintResult       # Jump to printing result

	SetXtoY:
	move $t1, $t2      # set x to y

	PrintResult:
	la $a0, outpStr    # Print string
	li $v0, 4
	syscall  

	move $a0, $t1      # move the result to $a0 for print
	li $v0, 1          # syscall for print integer
	syscall             # print the integer

	# Exit program
	li $v0, 10         # syscall for exit
	syscall
