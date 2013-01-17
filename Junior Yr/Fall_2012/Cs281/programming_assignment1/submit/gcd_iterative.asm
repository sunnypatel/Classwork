# Main program that calls the subroutine sum and prints the result.

	.text			# assembly directive that indicates what follows are instructions
	.globl  main		# assembly directive that makes the symbol main global
main:				# assembly label
	sub	$sp,$sp,8	# push stack to save registers needed by the system code that called main
	sw	$ra,0($sp)	# save return address

				# prepare parameters - arguments are placed in argument registers
	li	$v0,4		# tells syscall to print string
	la 	$a0, askForA	# print first instruction
	syscall

	li	$v0,5		# tells syscall to read from console
	syscall
	add	$t0,$v0,$zero	# save what was read to temp reg

	li	$v0,4		# ask for b
	la	$a0, askForB	# print askForB
	syscall

	li	$v0,5		# syscall to read from console the B value
	syscall
	add	$t1,$v0,$zero	# save B value to temp reg

	# prepare parameters set into argument regs
	add	$a0,$t0,$zero
	add	$a1,$t1,$zero
	jal	gcd		# call subroutine to compute gcd
	sw	$v0,4($sp)	# result returned in $v0 and stored on the stack

	# print the answer computed from gcd procedure
	
	li	$v0,4		# the argument to a system call is placed in register $v0
				# The value 4 tells syscall to print a string
	la	$a0,answer	# pseudo-instruction to load the address of the label str
				# The address of the string must be placed in register $a0
	syscall			# system call to print the string at address str

	li	$v0,1		# The value 1 tells syscall to print an integer
	lw	$a0,4($sp)	# Load the ans from the stack to register $a0 
	syscall			# System call to print the integer in register $a0
	
	lw	$ra,0($sp)	# restore return address used to jump back to system
	add	$sp,$sp,8	# pop stack to prepare for the return to the system
	jr	$ra		# [jump register] return to the system 


	.data             	# Assembly directive indicating what follows is data
askForA:                    	# label of address containing a string
	.asciiz "Please enter an A value: "  # Assembly directive used to create a null terminated ASCII string
askForB:
	.asciiz "Please enter a B value: "
youEntered:
	.asciiz "You entered a = "

answer:
	.asciiz "Iterative GCD is "

	.text

# Function gcd - compute the greatest common divisor
# Inputs:
#   int a, b passed in registers $a0, $a1.
# Output:
#   gcd(a,b) , stored in $s0 and returned in $v0
# Temporaries:  $t0 and $t1
#   by convention, $s0 must be saved, but $t0 and $t1 do not have to be saved 

gcd:
	sub	$sp,$sp,4	# Push stack to create room to save register $s0
	sw	$s0,0($sp)	# save $s0 on stack
	
	add	$t0,$a0,$0	# move arg1 to temp1 reg; a=t0
	add	$t1,$a1,$0	# move arg2 to temp2 reg; b=t1
	add	$t2,$zero,$zero	

	loop:
	beq	$t1,$zero,end	# while ( b != 0 )
	add	$t2,$t1,$zero	# c = b
	rem	$t1,$t0,$t1	# b = a % b;
	add	$t0,$t2,$zero	# a = c
	j loop

	end:
	add	$v0,$t0,$zero	# return a

	lw	$s0,0($sp)	# restore $s0 to value prior to function call
	add	$sp,$sp,4	# pop stack
	jr	$ra		# return to calling procedure
