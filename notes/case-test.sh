#!/bin/bash

function sf() {
	echo "1=$1" "2=$2";
}

case "$1" in
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
esac
