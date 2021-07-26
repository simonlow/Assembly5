.data 0x0
  display:	.asciiz "****************************************************************"
  columnPrompt:	.asciiz "Enter the column to print a line at (must be an integer in the range 0-7):\n"
  newline:	.ascii "\n"
  displayChar:  .ascii "*"
  lineChar:  .ascii "|" # Note, we don't need to use asciiz here, since we're storing a single character! (using asciiz would also store\0, which would be two characters)



.text 0x3000
main:
 					# Print the prompt for reading the column
   addi	$v0, $0, 4  			# system call 4 is for printing a string
   la 	$a0, columnPrompt 		# address of columnPrompt is in $a0
   syscall           			# print the string


   addi	$v0, $0, 5			# system call 5 is for reading an integer
   syscall 				# integer value read is in $v0
   add	$s0, $0, $v0			# copy the column number into $s0
   sll $s1, $s0, 2 		# multiply int by 4 to get addressing
   
   li $s1 64				# $s1 will store the size of the array
  
##   Insert code here for changing appropriate * characters to |                ##
change: 	
	#s2 to hold what row we're on
	add $t0, $s0, $s2		# give t0 the column + row
	la $t1, lineChar		# get the line char address on hand 
	lb $t2, 0($t1)			# give t2 the actual value
	sb $t2, 0($t0)			# put line char in its spot
	add $s2, $s2, 8			# increment s2 by 8 bytes for a new row
	beq $s2, 64, printing		# if we have changed all rows, move to print
	j change			# keep changing if not
  
##   Insert code here for printing thre resulting display.                      ##
##   The code for printing a new line character is given to you.		##
printing: 
 	# s3 to hold index
 	beq $s3, $s0, printline
 	addi $v0, $0, 11
 	lb $a0, displayChar			# load ascii char
 	syscall	
 	addi $s3, $s3, 1
 	beq $s3, 8, nextrow
   	j printing
   	
nextrow:
	addi $s4, $s4, 1		# increment the base index for the new row
	addi $v0, $0, 11		# print new line code
	lb $a0, newline
	syscall
	add $s3, $0, 0			# reset column indexer
	beq $s4, 8 exit			# if row count is at 256, that means rows 0-7 have been done
	j printing			# if you didn't exit, print the next row
	
printline:
	addi $v0, $0, 11
 	lb $a0, lineChar			# load ascii char
 	syscall
 	add $s3, $s3, 1
 	beq $s3, 8 nextrow
 	j printing
   	
print_new_line:
	addi $v0, $0, 11
	lb $a0, newline
	syscall

# Exit from the program
exit:
  ori $v0, $0, 10       		# system call code 10 for exit
  syscall               		# exit the program
