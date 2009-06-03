#!/bin/sh
#/***********************************************************************
#* copyright (c) 2004-2006 MALET Jean-luc aka cityhunter
#* This library is free software; you can redistribute it and/or modify
#* it under the terms of the LGPL v2.1 or latter at your option
#* http://www.gnu.org/copyleft/lesser.html
#************************************************************************/

mytest() {

        export CC=${CC:=gcc}
        export LD=${LD:=ld}
        export AR=${AR:=ar}
        export RANLIB=${RANLIB:=ranlib}
        export ARFLAGS=${ARFLAGS:=}
        confiserie=${confiserie:=..}
        . ${confiserie}/confiserie.cache.functions.sh

        test -d .confiserietmp && rm -r .confiserietmp
        echo ${TEST_SEPARATOR} >&2
        echo test_shared_static : testing library extention >&2
        cp -R ${confiserie}/C/libconfiserie/ .confiserietmp &&
        OLDPWD=${PWD}                             &&
        cd .confiserietmp                                   &&
        {

                if [ -z "$ENABLE_STATIC" ]; then
                        echo "WARNING : ENABLE_STATIC env not set, static libs will not be build"
                        echo "          unless shared libs aren't available"
                else
                        echo "----------------------------"
                        echo "testing if ar archives are supported"
                        export STATICLIBEXT=".a";
                        make clean
                        make || unset STATICLIBEXT;
                        STATIC_RESULT=${STATICLIBEXT};
                        unset STATICLIBEXT
                fi &&
                if [ -z "$DISABLE_DYNAMIC" ]; then
                        echo "DISABLE_DYNAMIC env not set => testing for shared lib format"
                        {
                                make clean
                                echo "----------------------------"
                                echo "testing if elf .so are supported"
                                export SHAREDLIBEXT=".so";
                                make
                        } ||
                        {
                                make clean
                                echo "----------------------------"
                                echo "testing if dll are supported"
                                export SHAREDLIBEXT=".dll";
                                make
                        } ||
                        {
                                make clean
                                unset SHAREDLIBEXT
                                echo "----------------------------"
                                echo "testing if ar archives are supported"
                                export STATICLIBEXT=".a";
                                make || unset STATICLIBEXT;
                        }
                fi
        }

        cd ${OLDPWD}
        rm -r .confiserietmp
        STATICLIBEXT=${STATIC_RESULT}

        conf_cache STATICLIBEXT
        conf_cache SHAREDLIBEXT
        conf_cache AR
        conf_cache RANLIB
        conf_cache ARFLAGS



        if [ -z "$STATICLIBEXT" ] && [ -z "$SHAREDLIBEXT" ]; then
                echo "can't determine extension.... " >&2
                return 1
        fi
}

mytest
