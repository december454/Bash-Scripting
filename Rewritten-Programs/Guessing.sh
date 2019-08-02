#! /bin/bash

#Setting the default value of the "userResponse" variable.
userResponse="y"

#The main while loop that encompasses the program and allows it to be re-run. Will run until the user declines to run it again.
while [[ $userResponse =~ "y" ]]; do
	#A while loop that will reord how large a range of numbers the user chooses.
	while true; do
		#Asking the user to enter a number.
		echo "Guessing Game - how many numbers?"
		#Taking in their input.
		read numMax

		#An if statement for if their number was too small.
		if [ $numMax -lt 2 ]; then
			#Saying that it was out of range and letting the loop ask them again.
			echo "Number out of range!"
		#An else statement for when an acceptable number is given.
		else
			#Breaking out of the loop.
			break
		#Closing the if statement.
		fi
	#Closing the while loop.
	done

	#Choosing a random number that the user will try to guess.
	chosenNum=$((RANDOM%=$numMax))
	#Resetting the number of attempts it took to guess the number.
	attempts=0

	echo

	#A while loop that will run until the user guesses the correct number.
	while true; do
		#Asking the user to enter a guess.
		echo "Enter a number between 1 and $numMax."
		#Recording their guess.
		read guess

		#An if statement for if their number was out of range.
		if [[ guess -gt numMax || guess -lt 1 ]]; then
			#Saying that it was out of range.
			echo "Number out of range!"
			#Recording their attempt.
			((attempts++))
		#An if statement for if their number was too small.
		elif [ $guess -lt $chosenNum ]; then
			#Telling them to guess higher.
			echo "Higher"
			#Recording their attempt.
                        ((attempts++))
		#An if statement for if their number was too large.
                elif [ $guess -gt $chosenNum ]; then
			#Telling them to guess lower.
                        echo "Lower"
			#Recording their attempt.
                        ((attempts++))
		#An else if statement for when the user guesses the correct number.
		elif [ $guess -eq $chosenNum ]; then
			#Recording their attempt.
			((attempts++))
			#Breaking out of the loop.
			break
		#Closing the if statement.
		fi
	#Closing the while loop.
	done

	#Telling the user how many tries it took for them to guess the number.
	echo -e "\nIt took $attempts guesses to guess $chosenNum."
	#Asking them if they would like to run the program again.
	echo 'Do you want to play again? (y/n)'
	#Taking in their response.
	read userResponse
	echo
#Closing the main loop.
done
