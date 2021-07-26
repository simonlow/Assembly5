.data 0x0
  array:	.word 20, 39, 20, 31, 40, 21, 31, 25, 20, 35, 27, 33, 39, 32, 33, 28
  readIntPrompt: .asciiz "Enter next integer (in range 20-40):\n"
  minPrompt:	.asciiz "Enter the new min value (an integer in the range 0-19):\n"
  maxPrompt:	.asciiz "Enter the new max value (an integer in the range 41-255):\n"
  newline:	.ascii "\n"
  .align 4 # This ensures that the space character is in the lowest order byte of its word
  spaceChar:    .asciiz " "
  arr: .space 16
  


.text 0x3000

main:
    
 					
   addi	$v0, $0, 4  			
   la 	$a0, minPrompt
   syscall           


   addi	$v0, $0, 5
   syscall 	
   add	$s0, $0, $v0 # NewMin is stored in $s0
   
   					
   addi	$v0, $0, 4  			
   la 	$a0, maxPrompt 		
   syscall           			


   addi	$v0, $0, 5			
   syscall 				
   add	$s1, $0, $v0 # NewMax is stored in $s1
   
   
##################################################################################
##   Insert code here for performing normalization of data                      ##
##################################################################################
normalize:
	#first of 16
	lb $t0, 0		# get first number
	sub $t0, $t0, 20
	sub $t1, $s1, $s0
	div $t2, $t1, 20
	mul $t3, $t2, $t0
	add $t4, $t3, $s0	# t4 holds I sub n
	sb $t4, 0
	
	#2nd of 16
	lb $t0, 4		# get first number
	sub $t0, $t0, 20
	sub $t1, $s1, $s0
	div $t2, $t1, 20
	mul $t3, $t2, $t0
	add $t4, $t3, $s0	# t4 holds I sub n
	sb $t4, 4
	
	#3rd of 16
	lb $t0, 8		# get first number
	sub $t0, $t0, 20
	sub $t1, $s1, $s0
	div $t2, $t1, 20
	mul $t3, $t2, $t0
	add $t4, $t3, $s0	# t4 holds I sub n
	sb $t4, 8
	
	#4th of 16
	lb $t0, 12		# get first number
	sub $t0, $t0, 20
	sub $t1, $s1, $s0
	div $t2, $t1, 20
	mul $t3, $t2, $t0
	add $t4, $t3, $s0	# t4 holds I sub n
	sb $t4, 12
	
	#5th of 16
	lb $t0, 16		# get first number
	sub $t0, $t0, 20
	sub $t1, $s1, $s0
	div $t2, $t1, 20
	mul $t3, $t2, $t0
	add $t4, $t3, $s0	# t4 holds I sub n
	sb $t4, 16
	
	#6th of 16
	lb $t0, 20		# get first number
	sub $t0, $t0, 20
	sub $t1, $s1, $s0
	div $t2, $t1, 20
	mul $t3, $t2, $t0
	add $t4, $t3, $s0	# t4 holds I sub n
	sb $t4, 20
	
	#7th
	lb $t0, 24		# get first number
	sub $t0, $t0, 20
	sub $t1, $s1, $s0
	div $t2, $t1, 20
	mul $t3, $t2, $t0
	add $t4, $t3, $s0	# t4 holds I sub n
	sb $t4, 24
	
	#8th
	lb $t0, 28		# get first number
	sub $t0, $t0, 20
	sub $t1, $s1, $s0
	div $t2, $t1, 20
	mul $t3, $t2, $t0
	add $t4, $t3, $s0	# t4 holds I sub n
	sb $t4, 28
	
	#9th
	lb $t0, 32		# get first number
	sub $t0, $t0, 20
	sub $t1, $s1, $s0
	div $t2, $t1, 20
	mul $t3, $t2, $t0
	add $t4, $t3, $s0	# t4 holds I sub n
	sb $t4, 32
	
	#10th
	lb $t0, 36		# get first number
	sub $t0, $t0, 20
	sub $t1, $s1, $s0
	div $t2, $t1, 20
	mul $t3, $t2, $t0
	add $t4, $t3, $s0	# t4 holds I sub n
	sb $t4, 36
	
	#11th
	lb $t0, 40		# get first number
	sub $t0, $t0, 20
	sub $t1, $s1, $s0
	div $t2, $t1, 20
	mul $t3, $t2, $t0
	add $t4, $t3, $s0	# t4 holds I sub n
	sb $t4, 40
	
	#12th
	lb $t0, 44		# get first number
	sub $t0, $t0, 20
	sub $t1, $s1, $s0
	div $t2, $t1, 20
	mul $t3, $t2, $t0
	add $t4, $t3, $s0	# t4 holds I sub n
	sb $t4, 44
	
	#13th
	lb $t0, 48		# get first number
	sub $t0, $t0, 20
	sub $t1, $s1, $s0
	div $t2, $t1, 20
	mul $t3, $t2, $t0
	add $t4, $t3, $s0	# t4 holds I sub n
	sb $t4, 48
	
	#14th
	lb $t0, 52		# get first number
	sub $t0, $t0, 20
	sub $t1, $s1, $s0
	div $t2, $t1, 20
	mul $t3, $t2, $t0
	add $t4, $t3, $s0	# t4 holds I sub n
	sb $t4, 52
	
	#15tj
	lb $t0, 56		# get first number
	sub $t0, $t0, 20
	sub $t1, $s1, $s0
	div $t2, $t1, 20
	mul $t3, $t2, $t0
	add $t4, $t3, $s0	# t4 holds I sub n
	sb $t4, 56
	
	#16th
	lb $t0, 60		# get first number
	sub $t0, $t0, 20
	sub $t1, $s1, $s0
	div $t2, $t1, 20
	mul $t3, $t2, $t0
	add $t4, $t3, $s0	# t4 holds I sub n
	sb $t4, 60
	
	
printing: 
	
	
	addi $v0, $0, 1 		# print int v0
	la $a0, 0
	syscall
	
	addi $v0, $0, 1 		# print int v0
	la $a0, 4
	syscall
	
	addi $v0, $0, 1 		# print int v0
	la $a0, 8
	syscall
	
	addi $v0, $0, 1 		# print int v0
	la $a0, 12
	syscall
	
	addi $v0, $0, 11
	lb $a0, newline
	syscall
 #new row
 
	addi $v0, $0, 1 		# print int v0
	la $a0, 16
	syscall
	
	addi $v0, $0, 1 		# print int v0
	la $a0, 20
	syscall
	
	addi $v0, $0, 1 		# print int v0
	la $a0, 24
	syscall
	
	addi $v0, $0, 1 		# print int v0
	la $a0, 28
	syscall
	
	addi $v0, $0, 11
	lb $a0, newline
	syscall
	
	#new row
 
	addi $v0, $0, 1 		# print int v0
	la $t1, 32
	syscall
	
	addi $v0, $0, 1 		# print int v0
	la $a0, 36
	syscall
	
	addi $v0, $0, 1 		# print int v0
	la $a0, 40
	syscall
	
	addi $v0, $0, 1 		# print int v0
	la $a0, 44
	syscall
	
	addi $v0, $0, 11
	lb $a0, newline
	syscall
	
	#new row
 
	addi $v0, $0, 1 		# print int v0
	la $a0, 48
	syscall
	
	addi $v0, $0, 1 		# print int v0
	la $a0, 52
	syscall
	
	addi $v0, $0, 1 		# print int v0
	la $a0, 56
	syscall
	
	addi $v0, $0, 1 		# print int v0
	la $a0, 60
	syscall
	
	addi $v0, $0, 11
	lb $a0, newline
	syscall
	
newrow:
	add $s2, $0, $0
	addi $v0, $0, 11
	lb $a0, newline
	syscall
	add $s3, $s3, 1			# keeping track of rows
	beq $s3, 4, exit
	j printing
	
##################################################################################
##   Insert code here for printing the normalized data. 			##
##   Separate each number with a space character.                               ##
##   You can adapt your ex2 printing for this part.				##
##################################################################################

# Exit from the program
exit:
  ori $v0, $0, 10       		# system call code 10 for exit
  syscall               		# exit the program
