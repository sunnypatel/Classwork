# Main program that calls the subroutine sum and prints the result.

	.text             # assembly directive that indicates what follows are instructions
	.globl  main      # assembly directive that makes the symbol main global
main:                   # assembly label
	sub	$sp,$sp,8	# push stack to save registers needed by the system code that called main
	sw	$ra,0($sp)	# save return address

				# prepare parameters - arguments are placed in argument registers
	li	$a0,4		# a = 4  - li is a pseudo-instruction that loads a constant.
	li	$a1,3		# b = 3
	li	$a2,2		# c = 2
	li	$a3,1		# d = 1
	jal	sum		# call subroutine sum to compute a+b+c+d
	sw	$v0,4($sp)  # result returned in $v0 and stored on the stack

# print the sum 
	
	li	$v0,4       # the argument to a system call is placed in register $v0
                        # The value 4 tells syscall to print a string
	la	$a0,str     # pseudo-instruction to load the address of the label str
                        # The address of the string must be placed in register $a0
	syscall           # system call to print the string at address str

	li	$v0,1       # The value 1 tells syscall to print an integer
	lw	$a0,4($sp)  # Load the sum from the stack to register $a0 
	syscall           # System call to print the integer in register $a0
	
	lw	$ra,0($sp)	# restore return address used to jump back to system
	add	$sp,$sp,8	# pop stack to prepare for the return to the system
	jr	$ra         # [jump register] return to the system 


	.data             # Assembly directive indicating what follows is data
str:                    # label of address containing a string
	.asciiz "sum = "  # Assembly directive used to create a null terminated ASCII string
	
# Function Sum - compute sum of 4 numbers
# Inputs:
#   int a, b, c, d passed in registers $a0, $a1, $a2, $a3.
# Output:
#   int s = a + b + c + d, stored in $s0 and returned in $v0
# Temporaries:  $t0 and $t1
#   by convention, $s0 must be saved, but $t0 and $t1 do not have to be saved 
# Notes:  This procedure could have been written without using temporaries or $s0.
#   This was done for illustrative purposes.

	.text
sum:
	sub	$sp,$sp,4   # Push stack to create room to save register $s0
	sw	$s0,0($sp)  # save $s0 on stack
                        # Since sum does not call any other procedures (leaf procedure)
                        # it is not necessary to save the return address $ra

	add	$t0,$a0,$a1	# a + b
	add	$t1,$a2,$a3	# c + d
	add	$s0,$t0,$t1	# $s = $t0 + $t1 = a + b + c + d
	add	$v0,$s0,-1	# return sum = s

	lw	$s0,0($sp)  # restore $s0 to value prior to function call
	add	$sp,$sp,4   # pop stack
	jr	$ra         # return to calling procedure
	

