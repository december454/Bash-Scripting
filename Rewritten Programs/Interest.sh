#! /bin/bash

echo "Please enter the amount fo the loan."
read loanAmount

echo -e "\nPlease enter the interest rate."
read interestRate

echo -e "\nPlease enter the number of years the loan is for."
read loanYears

totalInterest=`echo "$loanAmount * $interestRate * $loanYears / 100" | bc`

echo -e "\nYou spent $totalInterest dollars on interest over the past $loanYears years."
