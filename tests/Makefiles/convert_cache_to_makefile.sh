#!/bin/sh
#script de conversion d'un cache en C header
#take a single arg : the cache file
#output result on stdout

convert() {
	local result
	result=${1/\"/ }
	result=${result/\"/ }
	echo ${result}
}

cat $1 |
while read; do
	convert "$REPLY"
done

