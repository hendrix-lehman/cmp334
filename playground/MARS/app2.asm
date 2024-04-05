
	.text
	.globl __start  # defines globally the label __start
__start:  # the label __start, think of it as an address in the instruction memory
	
	# 'load' or moving values from data segment to registers 	      
	la $t1, hello # la instructions load address of data into a register
	
	lw $t1, hello # load word (lw), remember a 'word' is just another way of say 32-bits 
		      # lw instructions load 'word' of data from data segment to a register

	lh $t1, hello # lh instructions load 16-bits of data into a register
	
	lb $t1, hello # lb instructions load byte (8-bits) of data into a register
	
	# 'store' or moving values from registers to data segment
	li $t1, 0x646f6f47
	
	sw $t1, store
	
	sh $t1, store + 4
	
	sb $t1, store + 8
	
	# la $t2, store
	
	# register addressing using add instruction
	li $t2, 5
	li $t3, 2
	add $t1, $t2, $t3 # adding the values in registers $t2 and $t3 and writing the result in register $t1
	
	# immediate addressing using add instruction
	add $t1, $t2, 4 # adding the value in register $t2 and 4, writing the result in register $t1
	
	# base addressing using lw instruction
	la $t2, hello
	lw $t1, 8($t2)
	
	# PC-relative addressing
	li $t3, 0x646f6f47
	beq $t1, $t3, print # this instruction bypass instructions below if the value in $t1 and $t2 are equal
	
	j exit
print:
	li $v0, 4
	la $a0, store
	syscall
	

exit: # this label, is just an address in the instruction memory
	li $v0, 10 # load immediate (think of it as a constant value). The value 10 into register $v0
	syscall
	
	
	.data
hello: .asciiz "Hello"
	.align 2
store: .space 4