#!/bin/sh
#/***********************************************************************
#* copyright (c) 2004-2006 MALET Jean-luc aka cityhunter
#* This library is free software; you can redistribute it and/or modify
#* it under the terms of the LGPL v2.1 or latter at your option
#* http://www.gnu.org/copyleft/lesser.html
#************************************************************************/
confiserie=${confiserie:=..}
[ -z "${COMMON_TEST_DEFINITION_SOURCED}" ] && source ${confiserie}/common_test_definition.sh

mytest() {

        [ -z "${CC}" ] && runtest ${confiserie}/C/test_cc.sh
        export LIB_DIR=${confiserie}/C/libconfiserie/
        runtest ${confiserie}/script/Compiler_test_shared_static.sh
}

mytest
