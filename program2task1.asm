# CS 2640.01
# October 31, 2023
# Authors: Damian Varela and Joshua Estrada
# Github Repo Link: https://github.com/CS2640Assignments/Practice-With-Conditionals-and-Loops

.data
menu: .asciiz "---------------------------MAIN MENU-------------------------------\n(1)Get Letter Grade\n(2)Exit Program\n"
main_prompt: .asciiz "Enter '1' or '2' for your selection: "
score_prompt: .asciiz "Please enter a score as an integer value: "
new_score_prompt: .asciiz "Would you like to enter a new score?\n(Y)Yes  (N)No\n\nEnter 'Y' or 'N' for your selection: "
line_break: .asciiz "-------------------------------------------------------------------\n"
error1: .asciiz "Invalid Input\n"
error2: .asciiz "Grades can only be between 0 and 100.\n"

exit_text: .asciiz "The program will now exit.\n"
newline: .asciiz "\n"


.text
main:
	
	li $v0, 4
	la $a0, menu
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 4
	la $a0, main_prompt
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, newline
	syscall
	
	beq $t0, 1, loop
	beq $t0, 2, exit
	
	li $v0, 4
	la $a0, error1
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	j main
loop:
	li $v0, 4
	la $a0, score_prompt
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 4
	la $a0, newline
	syscall
	
	blt $s0, 0, bad_grade
	bgt $s0, 100, bad_grade
	
	bge $s0, 90, print_a
	bge $s0, 80, print_b
	bge $s0, 70, print_c
	bge $s0, 60, print_d
	j print_f
	
	
	subloop:
		li $v0, 4
		la $a0, new_score_prompt
		syscall
	
		li $v0, 12
		syscall
		move $t2, $v0
	
		li $v0, 4
		la $a0, newline
		syscall
	
		li $t3, 'Y'
		beq $t2, $t3, loop
	
		li $t4, 'N'
		beq $t2, $t4, main
		
		li $v0, 4
		la $a0, error1
		syscall
	
		li $v0, 4
		la $a0, newline
		syscall
		
		j subloop

	
bad_grade:
	li $v0, 4
	la $a0, error2
	syscall
	
	j loop			

print_a:
	li $v0, 11
    	la $a0, 'A'
    	syscall
    	
    	li $v0, 4
	la $a0, newline
	syscall
    	
    	j subloop

print_b:
	li $v0, 11
    	la $a0, 'B'
    	syscall
    	
      	li $v0, 4
	la $a0, newline
	syscall  	
    	
    	j subloop

print_c:
	li $v0, 11
    	la $a0, 'C'
    	syscall
    	
    	li $v0, 4
	la $a0, newline
	syscall    	
    	
    	j subloop

print_d:
	li $v0, 11
    	la $a0, 'D'
    	syscall
    	
      	li $v0, 4
	la $a0, newline
	syscall  	
    	
    	j subloop

print_f:
	li $v0, 11
    	la $a0, 'F'
    	syscall
    	
     	li $v0, 4
	la $a0, newline
	syscall   	
    	
    	
    	j subloop



exit:
	li $v0, 4
	la $a0, exit_text
	syscall
	
	li $v0, 10
	syscall		
