#!/bin/sh
#/***********************************************************************
#* copyright (c) 2004-2006 MALET Jean-luc aka cityhunter
#* This library is free software; you can redistribute it and/or modify
#* it under the terms of the LGPL v2.1 or latter at your option
#* http://www.gnu.org/copyleft/lesser.html
#************************************************************************/

mytest() {

set -x
        CC=${CC:=gcc}
        LD=${LD:=ld}
        AR=${AR:=ar}
        RANLIB=${RANLIB:=ranlib}
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
                        make || unset STATICLIBEXT;
                fi &&
                if [ -z "$DISABLE_DYNAMIC" ]; then
                        echo "DISABLE_DYNAMIC env not set => testing for shared lib format"
                        {
                                echo "----------------------------"
                                echo "testing if elf .so are supported"
                                export SHAREDLIBEXT=".so";
                                ls
                                make
                        } ||
                        {
                                echo "----------------------------"
                                echo "testing if dll are supported"
                                export SHAREDLIBEXT=".dll";
                                make
                        } || unset SHAREDLIBEXT
                fi
        }

        cd ${OLDPWD}
        rm -r .confiserietmp

        conf_cache STATICLIBEXT
        conf_cache SHAREDLIBEXT
        conf_cache AR
        conf_cache RANLIB
        conf_cache ARFLAGS



        if [ -z "$STATICLIBEXT" ] && [ -z "$SHAREDLIBEXT" ]; then
                echo "can't determine extension.... " >&2
                return 1
        fi
set +x
}

mytest
