#! /bin/bash

#if [ -z "$1" ]; then
#echo "It is null"
#fi

if [[ ! $1 =~ "/" ]]; then
	pwdtest=$(pwd)$"/"$1
fi

echo "$pwdtest"



#if "/" is at front and it is an absolute path

#if ther is a "/" but it is not at the front, relative path.
