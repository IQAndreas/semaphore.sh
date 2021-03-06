#!/bin/bash


function right_map() {
	# This should be an arry. ¯\_(ツ)_/¯
	case "$1" in
		0) echo '................................|.......33.......44...';;
		1) echo '.....................................33/......44......';;
		2) echo '...........................33--.....44................';;
		3) echo '.33.......44.........\................................';;
		4) echo '....33.......44......../..............................';;
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
		0) echo '............................../........11.......22....';;
		1) echo '............................../......11.......22......';;
		2) echo '...........................11--.....22................';; # Not in use!
		3) echo '.11.......22.........\................................';;
		4) echo '...11.......22.......\................................';;
		5) echo '......11.......22....../..............................';;
		6) echo '................................--11.......22.........';;
		7) echo '.........................................\11.......22.';;
		9) echo '......................................................';; # For debugging
		
		*)
			>&2 echo "ERROR: Cannot find a LEFT map with the ID of $1";
			echo '??????????????????????????????????????????????????????';;
	esac
}
