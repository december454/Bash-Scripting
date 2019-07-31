#! /bin/bash

set -e
set -o pipefail

#If the config directory (.mkscript) is not found.
if [ ! -e ~/.mkscript ]; then
	mkdir ~/.mkscript
	touch template.txt.
	echo -e "#! /bin/bash\n\nset -u\nset -e\nset -o pipefail" >> ~/.mkscript/template.txt

	echo "First run, config directory created at ~/.mkscript."
	echo "Find and edit file templetes there."
fi

#If the command was run with no parameters.
if [ -z "$1" ]; then
	echo "No filename specified."
	exit
fi

#An if statement which executes if an absolute path is given as the parameter, checks to see if the first character is a /.
#It will set the $destination to be the parameter, exactly as entered.
if [[ ${1:0:1} == "/" ]]; then
	destination=$1

#An else statement which executes if a relative path is given as the parameter.
#For the $destination, it will find the pwd and then append the parameter to the end of it.
else
        destination=$(pwd)$"/"$1
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
