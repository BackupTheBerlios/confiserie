#/***********************************************************************
#* copyright (c) 2004-2006 MALET Jean-luc aka cityhunter
#* This library is free software; you can redistribute it and/or modify
#* it under the terms of the LGPL v2.1 or latter at your option
#* http://www.gnu.org/copyleft/lesser.html
#************************************************************************/


mytest() {
  echo $TEST_SEPARATOR 
  echo "test_make_gnu.sh: checking if ${MAKE-make} is gnu style"
  if ${MAKE:=make} -f ${confiserie}/tools/Makefile.gnu >/dev/null; then
    echo "GNU like make" 
    exit 0;
  else
    exit 1
  fi
} 

mytest >&2
