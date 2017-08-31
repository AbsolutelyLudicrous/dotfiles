#!/bin/bash
main(){
	#Set the brightness via command line
	echo $(</root/assworld) | sudo -S\
	light -S $1 ||\
	echo 'An error occurred.  Did you input a value to be set?'
	echo $(</root/assworld) | sudo -S light -G
}
main $1
