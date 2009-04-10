#!/bin/sh
#/***********************************************************************
#* copyright (c) 2004-2006 MALET Jean-luc aka cityhunter
#* This library is free software; you can redistribute it and/or modify
#* it under the terms of the LGPL v2.1 or latter at your option
#* http://www.gnu.org/copyleft/lesser.html
#************************************************************************/

mytest() {
  clean() {
    rm -rf *.o *.so *.a *.exe testlibconfiserie
  }

  create_objects() {
    ${CC} -c -o libconfiserie.o ${CPPFLAGS} ${CFLAGS} ${confiserie}/C/libconfiserie.c 
  }

 # test_dll() {
    #  ${LD} ${LDFLAGS} -shared -Bdynamic \
    #        -soname libconfiserie.so -o libconfiserie.so  libconfiserie.o &&
    #  ${CC} ${CC_LDFLAGS} -L. -lconfiserie -o testlibconfiserie \
    #        ${confiserie}/C/testlibconfiserie.c &&
    #echo 'SHAREDLIBEXT=".so"' &&
    #export SHAREDLIBEXT='.so'
 #   echo
 # }

  test_shared() {
    {
      ${LD} ${LDFLAGS} -shared -Bdynamic -soname libconfiserie.so \
             -o libconfiserie.so  libconfiserie.o &&
      ${CC} ${CC_LDFLAGS} -L ./ -lconfiserie -o testlibconfiserie  \
            ${confiserie}/C/testlibconfiserie.c 
    }&&
    SHAREDLIBEXT=".so" &&
    conf_cache SHAREDLIBEXT
  }

  test_static() {
    {
      ${AR} -cr ${ARFLAGS} libconfiserie.a  libconfiserie.o &&
      ${RANLIB} libconfiserie.a &&
      ${CC} ${CC_LDFLAGS} -o testlibconfiserie ${confiserie}/C/testlibconfiserie.c \
            ./libconfiserie.a 
    }&&
    STATICLIBEXT=".a"  &&
		conf_cache STATICLIBEXT
  }


  CC=${CC:=gcc}
  LD=${LD:=ld}
  AR=${AR:=ar}
  RANLIB=${RANLIB:=ranlib}
	confiserie=${confiserie:=..}
	. ${confiserie}/confiserie.cache.functions.sh

	echo ${TEST_SEPARATOR} >&2
	echo test_shared_static : testing library extention >&2

  create_objects 1>/dev/null &&
  if [ -z "$ENABLE_STATIC" ]; then
    echo "WARNING : ENABLE_STATIC env not set, static libs will not be build" >&2
    echo "          unless shared libs aren't available" >&2
  else
    test_static 
  fi &&

  test_shared || test_static

  clean

  if [ -z "$STATICLIBEXT" ] && [ -z "$SHAREDLIBEXT" ]; then
		echo "can't determine extension.... " >&2
    return 1
  fi

}

mytest
