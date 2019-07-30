#! /bin/bash

#Asking the user to enter the loan amount.
echo "Please enter the amount fo the loan."
#Taking in their input.
read loanAmount

#Asking the user to enter their interest rate.
echo -e "\nPlease enter the interest rate."
#Taking in their input.
read interestRate

#Asking the user to enter how many years the loan is for.
echo -e "\nPlease enter the number of years the loan is for."
#Taking in their input.
read loanYears

#Calculating the total amount of interest they will pay on the loan. Using the bc calculator for float operations.
totalInterest=`echo "$loanAmount * $interestRate * $loanYears / 100" | bc`

#Telling the user how much they will spend on interest for the loan.
echo -e "\nYou spent $totalInterest dollars on interest over the past $loanYears years."
