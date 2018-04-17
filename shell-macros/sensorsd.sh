#!/usr/bin/env bash

#| Program to dump the output of lm_sensors to a specified file every five seconds
#| Example invocation would be:
#| 	sensorsd ~/output

function die(){
	echo "$@"
	echo Something went wrong!
	echo Check that you have lm_sensors installed.
	exit 1
}

function main(){
	touch ~/.cache/sensorsd-cookie
	while [[ -f ~/.cache/sensorsd-cookie ]]; do
		sensors >> $dumploc
		sleep 5
	done
	ps |
		grep -ie sleep |
		grep -vie grep |
		awk '{print $1}' |
		xargs kill -9
}

sensors || die > /dev/null
#dumploc=${$@:-"~/sensors-readouts"}
dumploc="$@"
main $dumploc
