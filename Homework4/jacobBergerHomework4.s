.data

.align 2
array: .word -2, -2, 3, 3, 5, 0, 0, 0, 1, 1, 0, 0, 0, 99, -1, -1, -1, 2, 2, 2
.align 2
n_elem: .word 20
prompt: .asciiz "Enter number: \n"
space: .asciiz " "

.text
main:

	la $t0, array	# load array
	la $s0, n_elem	# load n_elem
	lw $s0, 0($s0)	# store n_elem into s0

getInput:
	la $a0, prompt
	li $v0, 4
	syscall

	li $v0, 5
	syscall

	add $s1, $0, $v0	# user input stored at s1

	addi $t1, $0, 0		# init counter at t1

loop:

	beq $t1, $s0, endLoop

	lw $a0, ($t0)

	bleu $s1, $a0, increment # if input <= current element

		li $v0, 1
		syscall
		la $a0, space
		li $v0, 4
		syscall
		
		addi $t1, $t1, 1
		addi $t0, $t0, 4

	j loop

increment:
	addi $t1, $t1, 1
	addi $t0, $t0, 4
	j loop

endLoop:

#exit
addi $v0, $0, 10
syscall