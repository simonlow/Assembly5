.data 0x0
  
  nPrompt:	.asciiz "Enter the size (N) of the array:\n"
  newline:	.asciiz "\n"
  displayChar:  .asciiz "*"
  lineChar:  .asciiz "|"
  list: .space 400


.text 0x3000
main:
				# Print the prompt for reading N
	addi	$v0, $0, 4  			# system call 4 is for printing a string
	la 	$a0, nPrompt 			# address of nPrompt is in $a0
	syscall           			# print the string
	
	# read in the N (number of elements)
	addi	$v0, $0, 5			# system call 5 is for reading an integer
	syscall 				# integer value read is in $v0
 	add	$s0, $0, $v0			# copy N into $s0
 	addi 	$s1, $0, 0
 	add $s4, $s0, $s0			# save the size of the array * 4 to s4
	add $s4, $s4, $s4
 	beqz $s0, exit
 	j retrieve

##   Insert code here for reading N array elements into memory                  ##
retrieve:
	beq $s4, $s1, reverse			#checking to see if we're done retrieving
	addi $v0, $0, 5
	syscall
	add $t0, $0, $v0			# saving the retrieve int
	la $t3, list				# getting the address of list
	add $t2, $0, $s1			# making t2 have the exact address of the given int
	add $t1,  $t2, $t3			# giving t1 the address of the array
	sw $t0, 0($t1)				# putting the number in list
	addi $s1, $s1, 4			# incrementing the counter by 4 bytes
	j retrieve				# grab the next element
	
	
##   Insert code here for reversing the elements in memory                      ##
reverse:
	
	subi $s1, $s1, 4			# decrement s1 by one index so that 
	la $t1, list
	add $t2, $t1, $s5 			# give t2 the element index for s1
	add $t3, $t1, $s1			# give t3 the element index for s4
	lw $t4, 0($t2)				# give t4 the s1 element
	lw $t5, 0($t3) 				# give t5 the s4 element
	sw $t4, 0($t3)				# have these elements switch spots
	sw $t5, 0($t2)
	
	addi $s5, $s5, 4			# increment s5
	sub $t6, $s5, $s1			# calculate the difference between the indeces
	bgez $t6, printing			# branch to printing if you've passed the middle
	j reverse
	
	
	
	
##   Insert code here for printing the reversed array                           ##
printing:
	
	beq $s2, $s4, exit
					# use 0 from s2 for index
	addi $v0, $0, 1 		# print int v0
	la $t0, list 			# load list address
	add $t2, $s2, $t0 		# get indexed spot
	lw $t3, 0($t2) 			# get word from specified slot
	add $a0, $t3, 0			# load arg with int
	syscall 			# print the int
	addi $v0, $0, 4
	la $a0, newline			# print the new line
	syscall
	addi $s2, $s2, 4		# increment s2
	j printing
	

# Exit from the program
exit:
  ori $v0, $0, 10       		# system call code 10 for exit
  syscall               		# exit the program
