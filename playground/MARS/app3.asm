############################################################
#                                                        #
#                   text segment                         #
#                                                        #
############################################################

          .text
          .globl __start

__start:               #execution starts here

	# there's no concept of a function in MIPS
	# however, we can create something similar
	# let's make our own print function
	la $a0, hello
	jal print_string
	
	li $a0, 10
	li $a1, 12
	jal add
	
	add $a0, $v0, $zero
	jal print_int
	

exit:
	li $v0, 10
	syscall

#
# INPUT PARAMETERS:
# address to the value we'd like to print MUST be in register $a0 
#
print_string:
	li $v0, 4
	syscall
	jr $ra

#
# INPUT PARAMETERS:
# $a0 value to print
print_int:
	li $v0, 1
	syscall
	jr $ra
	
#
# INPUT PARAMETERS:
# $a0 and $a1
#
# OUTPUT:
# $v0
add:
	add $v0, $a0, $a1
	jr $ra
	

############################################################
#                                                        #
#                   data segment                         #
#                                                        #
############################################################

        .data

hello: 		.asciiz "Hello"
##
## End of filess