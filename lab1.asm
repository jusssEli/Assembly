# Elijah Rogers 9/21/2024
# 
#
# The code then prompts the user for 3 integer values.
# The code outputs the summation of these 3 values multiplied by 3.
#
# In MARS, make certain in "Settings" to check
# "popup dialog for input syscalls 5,6,7,8,12"
#
            .data      # data segment
	    .align 2   # align the next string on a word boundary
outpAuth:   .asciiz  "This is Eli Rogers presenting threeTimes against my will.\n"
outpPrompt: .asciiz  "Please enter an integer: "
	    .align 2   #align next prompt on a word boundary
outpStr:    .asciiz  "The sum of your numbers multiplied by 3 is: "
            .align 2   # align users input on a word boundary
#
# main begins
            .text      # code section begins
            .globl	main 
main:  
###############################################################
# system call to display the author of this code
	 la $a0,outpAuth	# system call 4 for print string needs address of string in $a0
	 li $v0,4		# system call 4 for print string needs 4 in $v0
	 syscall	

#
# system call to prompt user for FIRST input
	 la $a0,outpPrompt	# system call 4 for print string needs address of string in $a0
	 li $v0,4		# system call 4 for print string needs 4 in $v0
	 syscall
###############################################################
# write a system call to read the user's integer value
	li $v0, 5         # syscall for read integer
	syscall
	move $t0, $v0     # move first input to $t0

# We have not studied looping, so you will need to repeat the prompt for input
# and do the calculation as you see fit
# system call to prompt user for SECOND input
	 la $a0,outpPrompt	# system call 4 for print string needs address of string in $a0
	 li $v0,4		# system call 4 for print string needs 4 in $v0
	 syscall	
###############################################################
# write a system call to read the user's integer value
	li $v0, 5         # syscall for read integer
	syscall
	move $t1, $v0     # move first input to $t0
# system call to prompt user for THIRD input
	 la $a0,outpPrompt	# system call 4 for print string needs address of string in $a0
	 li $v0,4		# system call 4 for print string needs 4 in $v0
	 syscall	
###############################################################
# write a system call to read the user's integer value
	li $v0, 5         # syscall for read integer
	syscall
	move $t2, $v0     # move first input to $t0
################################################################
 # Multiplying the integers by3
	li $t3, 3                  # Load immediate constant 3 into $t3
    	mul $t0, $t0, $t3          # $t0 = first integer * 3
    	mul $t1, $t1, $t3          # $t1 = second integer * 3
    	mul $t2, $t2, $t3          # $t2 = third integer * 3

# Adding them together
    	add $t0, $t0, $t1          # $t0 = first int * 3 + second int * 3
    	add $t0, $t0, $t2          # $t0 = result + third int * 3
##################################################################

# system call to display "The sum of your numbers multiplied by 3 is: "
	 la $a0,outpStr 	# system call 4 for print string needs address of string in $a0
	 li $v0,4		# system call 4 for print string needs 4 in $v0
	 syscall  	
################################################################
# write a system call to display the calculation
#Moving to $a0 for output
	move $a0, $t0              # move sum to $a0 for print
	li $v0, 1                  # syscall for print integer
    	syscall

#
# Exit gracefully
         li   $v0, 10       # system call for exit
         syscall            # close file
###############################################################
