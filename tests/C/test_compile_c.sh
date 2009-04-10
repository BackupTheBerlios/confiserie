#!/bin/sh
#/***********************************************************************
#* copyright (c) 2004-2006 MALET Jean-luc aka cityhunter
#* This library is free software; you can redistribute it and/or modify
#* it under the terms of the LGPL v2.1 or latter at your option
#* http://www.gnu.org/copyleft/lesser.html
#************************************************************************/

mytest() {
  echo $TEST_SEPARATOR
  echo "$0: trying to compile $1" 
  if ! ${CC} -o mytest ${CPPFLAGS} ${CFLAGS} ${CC_LDFLAGS} $1 1>/dev/null; 
  then
    echo "error in compiling $1" 
    echo "the command issued was ${CC} -o test ${CPPFLAGS} ${CFLAGS} ${CC_LDFLAGS} $1" 
    cat $1 
    rm -f mytest
    exit 1 
  fi
  rm -f mytest
} 

mytest "$@">&2

