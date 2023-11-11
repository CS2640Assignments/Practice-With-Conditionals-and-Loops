.macro newline
li $v0, 4
la $a0, newline
syscall
.end_macro

.macro exit
li $v0, 10
syscall
.end_macro

.data
intro: .asciiz "This program asks the user to input a value for 'x' and 'y'.\nThen, it finds the value of x to the power of y.\nFor example, 2 to the power 3 is 8."
xvalue: .asciiz "Enter a number for 'x': "
yvalue: .asciiz "Enter a number for 'y': "
newline: .asciiz "\n"

.text
main:
	# Loop counter
	li $t0, 1
	
	# Displays intro prompt
	li $v0, 4
	la $a0, intro
	syscall
	
	#Creates 3 new lines using the macro
	newline
	newline
	newline
	
	# Displays x prompt
	li $v0, 4
	la $a0, xvalue
	syscall
	# Get the first int from the user
	li $v0, 5
	syscall
	move $s0, $v0	
	move $s2, $s0
	
	# Displays y prompt
	li $v0, 4
	la $a0, yvalue
	syscall
	# Get the first int from the user
	li $v0, 5
	syscall
	move $s1, $v0

loop:
	addi $t0, $t0, 1
	mul $s0, $s0, $s2
	beq $t0, $s1, answer
	j loop

answer:
	li $v0, 1
	move $a0, $s0
	syscall
end:
	exit
	