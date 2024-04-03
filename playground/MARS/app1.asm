# This is a comment
# The assembler ignores comments

# The program is divided in two segments
# 1. text segment (our code or instructions)
# 2. data segment (data used in our program)

################################################################
#             text segment                                     #
################################################################
	.text 
	.globl __start

__start:
	li $v0, 4
	la $a0, hello
	syscall

exit:
	li $v0, 10
	syscall
	

################################################################
#            data segment                                      #
################################################################	
	.data 
hello:  .asciiz "hello, world" 