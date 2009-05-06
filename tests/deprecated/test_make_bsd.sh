#/***********************************************************************
#* copyright (c) 2004-2006 MALET Jean-luc aka cityhunter
#* This library is free software; you can redistribute it and/or modify
#* it under the terms of the LGPL v2.1 or latter at your option
#* http://www.gnu.org/copyleft/lesser.html
#************************************************************************/

echo $TEST_SEPARATOR >&2
echo "$0: checking if ${MAKE-make} is BSD style" >&2
if ${MAKE:=make} -f ${confiserie}/Makefile.bsd >/dev/null 2>&1; then
	echo "BSD like make" >&2
	exit 0;
else
	exit 1
fi
