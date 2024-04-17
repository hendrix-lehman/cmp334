############################################################
#                                                        #
#                   text segment                         #
#                                                        #
############################################################

          .text
          .globl __start

__start:               #execution starts here

	la $a0, hello
	jal string_size
	
	add $a0, $v0, $zero
	jal print_int

exit:
	li $v0, 10
	syscall

# INPUT:
# $a0 - integer to print
print_int:
	li $v0, 1
	syscall
	jr $ra	

# INPUT PARAMETERS:
# $a0 - address of null terminated string to calculate size
# OUTPUT
# $v0 - size
string_size:

	li $t1, 0 # use $t1 as a counter
	add $t2, $a0, $zero # address of first byte
loop:	
	lb $t3, ($t2)
	beq $t3, $zero, done
	add $t1, $t1, 1 # increment counter
	add $t2, $t2, 1 # increment address by 1 byte
	j loop
done:
	add $v0, $t1, $zero
	jr $ra

	

############################################################
#                                                        #
#                   data segment                         #
#                                                        #
############################################################

        .data

hello: 		.asciiz "Write subroutine that calculate the size of this string"
##
## End of filess