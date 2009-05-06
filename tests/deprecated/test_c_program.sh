#!/bin/sh
#/***********************************************************************
#* copyright (c) 2004-2006 MALET Jean-luc aka cityhunter
#* This library is free software; you can redistribute it and/or modify
#* it under the terms of the LGPL v2.1 or latter at your option
#* http://www.gnu.org/copyleft/lesser.html
#************************************************************************/
#test_c_programm.sh list;of;headers lines;of;main
TEST_FILE=testfile.c

rm -f $TEST_FILE

save_isf=$IFS
IFS=;
for header in $1 do
	echo "#include<$header>" >> $TEST_FILE
done
echo "int main(int argc, char** argv)" >> $TEST_FILE
echo "{" >> $TEST_FILE
for body in $2 do
	echo "$body;" >> $TEST_FILE
done
echo "}" >>$TEST_FILE
if ! $confiserie/test_compile_c.sh $TEST_FILE; then
	rm -f $TEST_FILE
	exit 1
fi
rm -f $TEST_FILE

