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
	move	$t0,$v0		# prepare entered a value for passed as arg

	li	$v0,4		# ask for b
	la	$a0, askForB	# print askForB
	syscall

	li	$v0,5		# syscall to read from console the B value
	syscall
	move	$t1,$v0		# prepare entered b value for being passed as arg


	# prepare parameters set into argument regs
	move	$a0,$t0
	move	$a1,$t1
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
	.asciiz "Recursive GCD is "

	.text

# Function gcd - compute the greatest common divisor
# Inputs:
#   int a, b passed in registers $a0, $a1.
# Output:
#   gcd(a,b) , stored in $s0 and returned in $v0
# Temporaries:  $t0 and $t1
#   by convention, $s0 must be saved, but $t0 and $t1 do not have to be saved 

gcd:
	sub	$sp,$sp,4	# Push stack to create room to save register $ra
	sw	$ra,0($sp)	# save $ra register on stack

	bne	$a1,$0,L1	# If b!=0 then goto L1
	move	$v0,$a0		# b==0; move our ans a into return register v0
	add	$sp,$sp,4	# Pop back the stack
	jr	$ra		# return to calling procedure

L1:	
	rem	$t0,$a0,$a1	# save the result of a%b, which is remaindar of a/b in temp register $t0
	move	$a0,$a1		# a=b
	move	$a1,$t0		# b=a%b
	jal	gcd		# jump back to gcd

	# Finishing up
	lw	$ra,0($sp)	# restore $ra
	move	$v0,$a0		# move our answer from arg register to return value reg

	add	$sp,$sp,4	# Pop back stack
	jr	$ra		# return to calling procedure
