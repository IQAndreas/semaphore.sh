#!/bin/bash

function sf() {
	
	#clear;
	#./semaphore-figure.sh "$1" "$2";
	
	figure=$(./semaphore-figure.sh "$1" "$2");
	
	tput cup 0 0; # Reset cursor position
	echo "";
	echo "$figure";
	echo "    L=$1   R=$2    ";
	
	# Allow the third argument to be the speed of the flag waving,
	#  but optional, and defaults to 1 second.
	sleep ${3:-1};
}


clear;
case "$1" in

	0) # Test null values
		sf 0 0;
		sf 9 9;
		sf 0 0;
		;;
	
	1) # Test all arms individually

		sf 9 9;
		for l in {0..7}; do sf $l 9; done
		for r in {0..7}; do sf 9 $r; done	
		sf 9 9;
		;;
	
	2) # Test commands
		./semaphore.sh REST;
		./semaphore.sh ACKNOWLEDGE;
		./semaphore.sh ERROR;
		./semaphore.sh REST;
		./semaphore.sh CORRECT;
		./semaphore.sh CANCEL;
		./semaphore.sh REST;
		;;
	
	3) # Test all letters
		./semaphore.sh "The quick brown fox jumped over the lazy dog.";
		;;
	
	4) # Test all letters
		./semaphore.sh "ABC 1234567890 DEF";
		;;
	
	*) # Generic test
		./semaphore.sh "Hello world.";
		;;

esac

