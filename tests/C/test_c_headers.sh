#!/bin/sh
#/***********************************************************************
#* copyright (c) 2004-2006 MALET Jean-luc aka cityhunter
#* This library is free software; you can redistribute it and/or modify
#* it under the terms of the LGPL v2.1 or latter at your option
#* http://www.gnu.org/copyleft/lesser.html
#************************************************************************/
mytest() {
  local testfile="confiserietest.c"


  clean_all() {
    rm -f confiserietest.c
    rm -f compile.log
  }

  run_test() {

    echo "testing headers : " >&2

    rm -f ${testfile}
    touch ${testfile}
    while [ "$#" -gt 0 ]; do
      echo "#include <$1>" >> ${testfile}
      echo "#include <$1>" >&2
      shift
    done
    cat ${confiserie}/C/simple_c.c >> ${testfile}

    if ! ${confiserie}/C/test_compile_c.sh ${testfile} 2>compile.log; 
    then
      echo "failed program was : " >&2
      cat compile.log >&2
      clean_all
      exit 1;
    fi
  }



  echo $TEST_SEPARATOR >&2
  run_test "$@" && echo "$@" | ${confiserie}/create_config_h.sh
  clean_all
}

mytest

