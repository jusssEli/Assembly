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
	prompt1: .asciiz "Enter value for Register 1: "
    	prompt2: .asciiz "Enter value for Register 2: "
    	result1: .asciiz "Final value in Register 1: "
    	result2: .asciiz "Final value in Register 2: "
    	newLine: .asciiz "\n"
#
# main begins
            .text      # code section begins
            .globl	main 
main:  	
# system call to prompt user for FIRST input
	 la $a0, prompt1	# system call 4 for print string needs address of string in $a0
	 li $v0,4		# system call 4 for print string needs 4 in $v0
	 syscall
# write a system call to read the user's integer value
	li $v0, 5         # syscall for read integer
	syscall
	move $t0, $v0     # move first input to $t0
# system call to prompt user for SECOND input
	 la $a0, prompt2	# system call 4 for print string needs address of string in $a0
	 li $v0,4		# system call 4 for print string needs 4 in $v0
	 syscall	
# write a system call to read the user's integer value
	li $v0, 5         # syscall for read integer
	syscall
	move $t1, $v0     # move first input to $t0
#The swap
	move $t2, $t0
	move $t0, $t1
	move $t1, $t2
#Printing
#result 1
	li $v0, 4	#syscall print string
	la $a0, result1
	syscall  

	move $a0, $t0      # move the result to $a0 for print
	li $v0, 1          # syscall for print integer
	syscall             # print the integer
	
#Printing new line
	li $v0, 4	#syscall print string
	la $a0, newLine
	syscall
#result 2
	li $v0, 4	#syscall print string
	la $a0, result2
	syscall  

	move $a0, $t1      # move the result to $a0 for print
	li $v0, 1          # syscall for print integer
	syscall             # print the integer
############################################################################
#Printing new line
	li $v0, 4	#syscall print string
	la $a0, newLine
	syscall
############################################################################
#DOING THE SAME WITH FLOATS
# system call to prompt user for FIRST input
#	 la $a0, prompt1	# system call 4 for print string needs address of string in $a0
#	 li $v0,4		# system call 4 for print string needs 4 in $v0
#	 syscall
# write a system call to read the user's integer value
#	li $v0, 2         # syscall for read float
#	syscall
#	mov.s $f0, $f0     # move first input to $t0
# system call to prompt user for SECOND input
#	 la $a0, prompt2	# system call 4 for print string needs address of string in $a0
#	 li $v0,4		# system call 4 for print string needs 4 in $v0
#	 syscall	
# write a system call to read the user's integer value
#	li $v0, 2         # syscall for read float
#	syscall
#	mov.s $f1, $f0     # move first input to $t0
#The swap
#	mov.s $f2, $f0
#	mov.s $f0, $f1
#	mov.s $f1, $f2
#Printing
#result 1
#	li $v0, 4	#syscall print string
#	la $a0, result1
#	syscall  

#	mov.s $f12, $f0      # move the result to $a0 for print
#	li $v0, 3          # syscall for print integer
#	syscall             # print the integer
	
#Printing new line
#	li $v0, 4	#syscall print string
#	la $a0, newLine
#	syscall
#result 2
#	li $v0, 4	#syscall print string
#	la $a0, result2
#	syscall  

#	mov.s $f12, $f1      # move the result to $a0 for print
#	li $v0, 3          # syscall for print integer
#	syscall             # print the integer
# Exit program
	li $v0, 10         # syscall for exit
	syscall