
array: .space 32

  .text         
  .globl  main 
main:               
#prep stage
  sub  $sp,$sp,32    
  li $t0, 1
  sw $t0,0($sp)                    
    
  li $t0, 2
  sw	$t0,4($sp)
                       
  li $t0, 3
  sw	$t0,8($sp)  
                       
  li $t0, 4
  sw	$t0,12($sp) 
  li $t0, 5

  sw	$t0,16($sp)
  li $t0, 6

  sw	$t0,24($sp) 
  li $t0, 7
  sw	$t0,28($sp)  

                       
addi $s0, $0, 7  # size of the array goes into R2.
add $v0, $zero, $zero 
addi $v1, $sp, 0 

addi $a0, $zero, 4 
Loop:  sll $a1, $v0, 2 #Multiply $r2 by 4 and save it in $r5
add $a1, $a1, $v1 #recalculate address of element 

lw $a2, 0($a1)  # Load the element into $r6 

beq $a0, $a2, Found  # if the element was found, jump to found 

addi $v0, $v0, 1  # i++ 

slt $a3, $v0, $s0  # r7 == 1 if $s0 < $v0

beq $zero, $a3, Exit  # if looped thru entire array, than just exit.

j Loop  # Else,  jump to Loop 

Found: sw $a2, 32($sp)  # save address to a2

j Done  #Jump over 
Exit: sw $zero, 32($sp) 
Done: add $zero, $zero, $zero  #nop 


# print search results
	
	li	$v0,1       # prep syscall to print int
	lw $a0 32($sp) 

	syscall           
	add	$sp,$sp,32	# pop stack
	jr	$ra         # return 


	.data           
str:                  
	.asciiz "sum = "  
	
