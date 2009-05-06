#/bin/sh
#/***********************************************************************
#* copyright (c) 2004-2006 MALET Jean-luc aka cityhunter
#* This library is free software; you can redistribute it and/or modify
#* it under the terms of the LGPL v2.1 or latter at your option
#* http://www.gnu.org/copyleft/lesser.html
#************************************************************************/
WHICH=${WHICH:=which}
confiserie=${confiserie:=..}
. ${confiserie}/confiserie.cache.functions.sh


mytest() {

	create_CC_LDFLAGS() {
		while [ $# -gt 0 ]; do
			echo -n "-Wl,$1 "
			shift
		done
	}

	echo ${TEST_SEPARATOR} >&2
  if [ -z "${CC}" ]; then
    {
			echo "CC not set trying autodetection"
			CC=$(${WHICH} gcc) ||
			CC=$(${WHICH} c99) ||
			CC=$(${WHICH} cc)  ||
			{
				echo "this package require a C compiler and no CC variable exported!"
				echo "gcc c99 and cc are not found in PATH"
				echo "please setup a decent environnement before trying to compile"
				return 1
			}
    } >&2
  fi
	conf_cache CC
	
  if [ -z "$CFLAGS" ]; then 
    {
			CFLAGS="-O2"
			echo "CFLAGS not set, using default '-O2'"
    } >&2
  fi
	conf_cache CFLAGS

	echo #saving C env
	conf_cache CPPFLAGS
	CC_LDFLAGS="${CC_LDFLAGS} $(create_CC_LDFLAGS $LDFLAGS)";
	conf_cache CC_LDFLAGS


  {
    echo "checking for C compiler version" 
    echo "$($CC --version </dev/null 2>/dev/null ||
    $CC -v </dev/null  2>/dev/null ||
    $CC -V </dev/null 2>/dev/null )" 
  }>&2 

  if ! ${CC} -o mytest ${CPPFLAGS} ${CFLAGS} ${CC_LDFLAGS} ${confiserie}/C/simple_c.c 1>/dev/null; 
  then
    {
      echo "error in compiling simple_c.c" 
      echo "the command issued was "
      echo "${CC} -o test ${CPPFLAGS} ${CFLAGS} ${CC_LDFLAGS} ${confiserie}/C/simple_c.c" 
    }>&2
    rm -f mytest
		
    return 1 
  fi

  # Check the compiler produces executables we can run.  If not, either
  # the compiler is broken, or we cross compile.
  echo -n "checking whether the C compiler works : " >&2
  if test "$cross_compiling" != yes; then
    if ! ./mytest; then
      {
        echo "no" 
        echo "$0: error: cannot run C compiled programs. " 
        echo "If you meant to cross compile, use --crosscompile". 
      } >&2
      rm -f mytest
      return 1;
    fi
  fi
  echo "yes" >&2
  rm -f mytest

  return 0
}

mytest
