.data
message1: .asciiz "Enter the first INT\n"
message2: .asciiz "Enter the second INT\n"
message3: .asciiz "Your result: \n"

.text
main:

#print first message
la $a0, message1
addi $v0, $0, 4
syscall

#read and store first int
addi $v0, $0, 5
syscall
add $t0, $0, $v0

#print second message
la $a0, message2
addi $v0, $0, 4
syscall

#read and store second int
addi $v0, $0, 5
syscall
add $t1, $0, $v0

#print result message
la $a0, message3
addi $v0, $0, 4
syscall

#calculate and display result
sub $a0, $t0, $t1
addi $v0, $0, 1
syscall

#exit
addi $v0, $0, 10
syscall