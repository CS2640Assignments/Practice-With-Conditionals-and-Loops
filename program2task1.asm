# CS 2640.01 program 2
# October 31, 2023
# Authors: Joshua Estrada and Damian Varela
# Github Repo Link: https://github.com/CS2640Assignments/Practice-With-Conditionals-and-Loops

.data
menu: .asciiz "---------------------------MAIN MENU-------------------------------\n(1)Get Letter Grade\n(2)Exit Program\n"
main_prompt: .asciiz "Enter '1' or '2' for your selection: "
score_prompt: .asciiz "Please enter a score as an integer value: "
new_score_prompt: .asciiz "Would you like to enter a new score?\n(Y)Yes  (N)No\n\nEnter 'Y' or 'N' for your selection: "
line_break: .asciiz "-------------------------------------------------------------------\n"
error1: .asciiz "Invalid Input\n"
error2: .asciiz "Grades cannot be less than 0.\n"

exit_text: .asciiz "The program will now exit.\n"
newline: .asciiz "\n"


.text
main:
	# prints out main menu screen
	li $v0, 4
	la $a0, menu
	syscall
	
	# prints out newline to properly divide
	li $v0, 4
	la $a0, newline
	syscall
	
	# prints out main prompt
	li $v0, 4
	la $a0, main_prompt # asks for 1 or 2 as input
	syscall
	
	# reads choice and stores it in $t0
	li $v0, 5
	syscall
	move $t0, $v0
	
	# prints out newline to properly divide
	li $v0, 4
	la $a0, newline
	syscall
	
	# prints out line brak
	li $v0, 4
	la $a0, line_break
	syscall
	
	beq $t0, 1, loop # jumps to loop if 1 was selected
	beq $t0, 2, exit # exits program if 2 was selected
	
	# otherwise, print an error since 1 and 2 are the only valid options
	li $v0, 4
	la $a0, error1
	syscall
	
	# prints out newline to properly divide
	li $v0, 4
	la $a0, newline
	syscall
	
	# reprompt the user
	j main
loop:
	# prompt the user to enter a score between 0 and 100
	li $v0, 4
	la $a0, score_prompt
	syscall
	
	# takes in user input and stores it in $s0
	li $v0, 5
	syscall
	move $s0, $v0
	
	# prints out newline to properly divide
	li $v0, 4
	la $a0, newline
	syscall
	
	# prints error and reprompts if input not between 0 and 100
	blt $s0, 0, bad_grade
	# bgt $s0, 100, bad_grade
	
	# print the corresponding letter grade
	bge $s0, 90, print_a # 90 and up is an A
	bge $s0, 80, print_b # 80 and up is a B
	bge $s0, 70, print_c # 70 and up is a C
	bge $s0, 60, print_d # 60 and up is a D
	j print_f # everything lower than a 60 is an F
	
	
subloop:
	# asks user if they want to enter another grade
	li $v0, 4
	la $a0, new_score_prompt
	syscall
	
	# takes in a character and stores it in $t2
	li $v0, 12
	syscall
	move $t2, $v0
	
	# print newline to properly divide
	li $v0, 4
	la $a0, newline
	syscall
	
	# checks if user entered 'Y'
	li $t3, 'Y' # stores the 'Y' character in $t3
	beq $t2, $t3, loop # compares user input with letter
	
	# checks if user entered 'N'
	li $t4, 'N' # stores the 'N' character in $t4
	beq $t2, $t4, main # compares user input with letter
	
	# otherwise prints out an error since 'Y' and 'N' are the only valid options					
	li $v0, 4
	la $a0, error1
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
		
	# reprompts user	
	j subloop

	
bad_grade:
	# prints error and re-prompts
	li $v0, 4
	la $a0, error2
	syscall
	
	j loop			

print_a:
	# prints grade and re-enters the loop
	li $v0, 11
    	la $a0, 'A'
    	syscall
    	
    	li $v0, 4
	la $a0, newline
	syscall
    	
    	j subloop

print_b:
	# prints grade and re-enters the loop
	li $v0, 11
    	la $a0, 'B'
    	syscall
    	
      	li $v0, 4
	la $a0, newline
	syscall  	
    	
    	j subloop

print_c:
	# prints grade and re-enters the loop
	li $v0, 11
    	la $a0, 'C'
    	syscall
    	
    	li $v0, 4
	la $a0, newline
	syscall    	
    	
    	j subloop

print_d:
	# prints grade and re-enters the loop
	li $v0, 11
    	la $a0, 'D'
    	syscall
    	
      	li $v0, 4
	la $a0, newline
	syscall  	
    	
    	j subloop

print_f:
	# prints grade and re-enters the loop
	li $v0, 11
    	la $a0, 'F'
    	syscall
    	
     	li $v0, 4
	la $a0, newline
	syscall   	
    	
    	
    	j subloop



exit:
	# prints the exit text and exits the program
	li $v0, 4
	la $a0, exit_text
	syscall
	
	li $v0, 10
	syscall		
