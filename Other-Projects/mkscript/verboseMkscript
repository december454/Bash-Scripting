#! /bin/bash

set -e
set -o pipefail

#An if statement which executes when the config directory (.mkscript) is not found.
#It will create the directory in the user's home folder and then add a default template.
if [ ! -e ~/.mkscript ]; then #If .mkscript doesn't exist.
	mkdir ~/.mkscript #Making the dir.
	touch template.txt #Making the template file.
	echo -e "#! /bin/bash\n\nset -u\nset -e\nset -o pipefail" >> ~/.mkscript/template.txt #Filling in the template file.

	echo "First run, config directory created at ~/.mkscript." #Message to user.
	echo "Find and edit file templetes there." #Message to user.
fi

#An if statement which executes if the command was run with no parameters.
#Currently it will alert the user and then exit. WORK ON MAKING IT DISPLAY A HELPFILE IN THE FUTURE.
if [ -z "$1" ]; then
	echo "No filename specified."
	exit
fi

#An if statement which executes if an absolute path is given as the parameter, checks to see if the first character is a /.
#It will set the $destination to be the parameter, exactly as entered.
if [[ ${1:0:1} == "/" ]]; then
	destination=$1 #Set the $destination.
	#echo "This must be an absolute path." #Uncomment for debugging.

#An else statement which executes if a relative path is given as the parameter.
#For the $destination, it will find the pwd and then append the parameter to the end of it.
else
        destination=$(pwd)$"/"$1 #Set the $destination.
	#echo "This must be a relative path." #Uncomment for debugging.
fi

#An if statement that executes when the file already exists.
#Currently it will alert the user and exit. WORK ON HAVING IT PROMPT THE USER TO EITHER OVERRIDE OR APPEND.
if [ -e "$destination" ]; then

	echo "The file already exists."
	exit
fi

#The bulk of the program. Here it will create the script, make it executeable, apply the template, and open it in nano.
#MUCH MORE CAN BE ADDED, WORK ON ADDITIONS.
touch "$destination"

chmod +x "$destination"

cat ~/.mkscript/template.txt > "$destination"

nano "$destination"


