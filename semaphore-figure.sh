#!/bin/bash

PADX_BEGIN=$'  * ';
PADX_END=$' *  \n';
PADY_BEGIN=$'  # * * * * * #  \n';
PADY_END=$'  # * * * * * #  ';
#PADY=$'\n';
W=9;
H=6;
SIZE=$(( $W * $H ));

NL=$'\n';

# This character is ignored (used to be space, but this was easier to read)
BLANK='.';

BG=' ';
MAN=$'\033[1;37m'
FLAG_1=$'\033[1;31m#\033[0m'
FLAG_2=$'\033[1;33m#\033[0m'
FLAG_3=$'\033[1;31m#\033[0m'
FLAG_4=$'\033[1;33m#\033[0m'

# Land colors
#FLAG_3=$'\033[1;37m#\033[0m'
#FLAG_4=$'\033[1;34m#\033[0m'

CLEAR=$'\033[0m'

# Render order: (items on top have precedence)
#  - RIGHT ARM AND FLAG
#  - LEFT ARM AND FLAG
#  - BODY

function get_char() {
	local map=$(right_map "$2");
	local char="${map:$3:1}";
	if [ "$char" = "$BLANK" ]; then
		map=$(left_map "$1");
		char="${map:$3:1}";
		if [ "$char" = "$BLANK" ]; then
			# Body map (The default background)
			map='......................0........|........|.............';
			char="${map:$3:1}";
		fi
	fi
	
	case "$char" in
		1) echo -n "$FLAG_1";;
		2) echo -n "$FLAG_2";;
		3) echo -n "$FLAG_3";;
		4) echo -n "$FLAG_4";;
		
		0) echo -n "${MAN}${char}${CLEAR}";;
		\\) echo -n "${MAN}${char}${CLEAR}";;
		\/) echo -n "${MAN}${char}${CLEAR}";;
		\|) echo -n "${MAN}${char}${CLEAR}";;
		-) echo -n "${MAN}${char}${CLEAR}";;
		
		"$BLANK") echo -n " ";;
		*) echo -n "$char";;
	esac
}

function right_map() {
	# This should be an arry. ¯\_(ツ)_/¯
	case "$1" in
		0) echo '................................|.......33.......44...';;
		1) echo '.....................................33/......44......';;
		2) echo '...........................33--.....44................';;
		3) echo '.33.......44.........\................................';;
		4) echo '....33.......44........|..............................';;
		5) echo '......33.......44....../..............................';;
		6) echo '................................--33.......44.........';; # Not in use!
		7) echo '................................\.........33.......44.';;
		9) echo '......................................................';; # For debugging
		
		*)
			>&2 echo "ERROR: Cannot find a RIGHT map with the ID of $1";
			echo '??????????????????????????????????????????????????????';;
	esac
}

function left_map() {
	# This should be an arry. ¯\_(ツ)_/¯
	case "$1" in
		0) echo '..............................|........11.......22....';;
		1) echo '............................../......11.......22......';;
		2) echo '...........................11--.....22................';; # Not in use!
		3) echo '.11.......22.........\................................';;
		4) echo '...11.......22.......|................................';;
		5) echo '......11.......22....../..............................';;
		6) echo '................................--11.......22.........';;
		7) echo '.........................................\11.......22.';;
		9) echo '......................................................';; # For debugging
		
		*)
			>&2 echo "ERROR: Cannot find a LEFT map with the ID of $1";
			echo '??????????????????????????????????????????????????????';;
	esac
}

left_id="$1";
right_id="$2";

result="";

for (( i=0; i<${SIZE}; i++ )); do
	
	if [ $i -eq 0 ]; then
		result+="${PADY_BEGIN}${PADX_BEGIN}"
	elif [ $(($i % $W)) -eq 0 ]; then
		result+="${PADX_END}${PADX_BEGIN}";
	fi
	
	result+=$(get_char "$left_id" "$right_id" "$i");

done

result+="${PADX_END}${PADY_END}";

echo "$result";
exit 0;

