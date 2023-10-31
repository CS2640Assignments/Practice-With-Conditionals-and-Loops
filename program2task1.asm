# CS 2640.01
# October 31, 2023
# Authors: Damian Varela and Joshua Estrada
# Github Repo Link: https://github.com/CS2640Assignments/Practice-With-Conditionals-and-Loops

.data
main_prompt: .asciiz "Enter '1' or '2' for your selection: "
score_prompt: .asciiz "Please enter a score as an integer value: "
new_score_prompt: .asciiz "Would you like to enter a new score?\n(Y)Yes  (N)No\n\nEnter 'Y' or 'N' for your selection: "

exit_text: .asciiz "The program will now exit."
newline: .asciiz "\n"


.text
main:
	
	
	j exit

	

exit:
	li $v0, 10
	syscall		