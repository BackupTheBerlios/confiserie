#/***********************************************************************
#* copyright (c) 2004-2006 MALET Jean-luc aka cityhunter
#* This library is free software; you can redistribute it and/or modify
#* it under the terms of the LGPL v2.1 or latter at your option
#* http://www.gnu.org/copyleft/lesser.html
#************************************************************************/

mytest() {
  echo $TEST_SEPARATOR >&2
  echo "test_makevariable.sh: checking if ${MAKE-make} set \$(MAKE)" >&2

	# GNU make sometimes prints "make[1]: Entering...", which would confuse us.
	eval `${MAKE-make} -f ${confiserie}/tools/Makefile.testmake 2>/dev/null | grep temp=`
	if test -z "$ac_maketemp"; then
		echo "MAKE=${MAKE:=make}"
    export MAKE=${MAKE:=make}
		exit 1;
	else
		exit 0;
	fi
}

mytest


