#!/bin/bash

# Uppercase for simplicity
input=$(echo "$1" | tr '[a-z]' '[A-Z]');

function sf() {
	
	#clear;
	#./semaphore-figure.sh "$1" "$2";
	
	figure=$(./semaphore-figure.sh "$1" "$2");
	
	tput cup 0 0; # Reset cursor position
	echo "";
	echo "$figure";
	echo "";
	echo " ${input_done}${HIGHLIGHT}${char}${CLEAR} ";
	
	# Allow the third argument to be the speed of the flag waving,
	#  but optional, and defaults to 1 second.
	sleep ${3:-1}; 
}

case "$1" in
	REST)
		char="    [REST]     ";
		sf 0 0;
		exit 0;
		;;
	ERROR)
		char="    [ERROR]    ";
		sf 3 5 0.2; sf 1 7 0.2;
		sf 3 5 0.2; sf 1 7 0.2;
		sf 3 5 0.2; sf 1 7 0.2;
		sf 3 5 0.2; sf 1 7 0.2;
		sf 3 5 0.2; sf 1 7 0.2;
		sf 3 5 0.2; sf 1 7 0.2;
		sf 3 5 0.2; sf 1 7 0.2;
		sf 3 5 0.2; sf 1 7 0.2;
		exit 0;
		;;
	ACK|ACKNOWLEDGE)
		char=" [ACKNOWLEDGE] ";
		sf 3 0;
		exit 0;
		;;
	CORRECT)
		char="   [CORRECT]   ";
		sf 3 0;
		exit 0;
		;;
	CANCEL)
		char="   [CANCEL]    ";
		sf 3 7;
		exit 0;
		;;
esac

HIGHLIGHT=$'\033[7m'
ERR=$'\033[1;91m'
CLEAR=$'\033[0m'

input_done="";
is_numeric=false;

clear;

for (( i=0; i<${#input}; i++ )); do
	char="${input:$i:1}"
	
	case "$char" in
		[0-9])
			if [ "$is_numeric" = false ]; then
				sf 4 5;
				is_numeric=true;
			fi
			;;
		*)
			if [ "$is_numeric" = true ]; then
				sf 4 6;
				is_numeric=false;
			fi
			;;
	esac
	
	case "$char" in
		
		A|1) sf 1 0;;
		B|2) sf 2 0;;
		C|3) sf 3 0;;
		D|4) sf 4 0;;
		E|5) sf 0 5;;
		F|6) sf 0 6;;
		G|7) sf 0 7;;
		H|8) sf 2 1;;
		I|9) sf 1 3;;
		J)   sf 4 6;;
		K|0) sf 1 4;;
		L) sf 1 5;;
		M) sf 1 6;;
		N) sf 1 7;;
		O) sf 2 3;;
		P) sf 2 4;;
		Q) sf 2 5;;
		R) sf 2 6;;
		S) sf 2 7;;
		T) sf 3 4;;
		U) sf 3 5;;
		V) sf 4 7;;
		W) sf 5 6;;
		X) sf 5 7;;
		Y) sf 3 6;;
		Z) sf 7 6;;
		
		\ )
			# Space. Ignore this one and keep going.
			;;
		
		[.,!])
			# Punctuation. We'll treat this like a REST.
			sf 0 0;
			;;
		*)
			# Unknown character
			# Permanently change the color of the character in the output
			char="${ERR}${char}${CLEAR}";
			sf 0 0
			;;
	esac

	input_done="${input_done}${char}";
	
done

# End in the rest position
char="";
sf 0 0;


