#!/bin/sh
# $1 name
# this script get infomation from *_DESC *_VERSION *_REQUIRES *_LIBS *_CFLAGS
# variables and create a corresponding pkg-config compatible file on 
# stdout.  * is replaced by canocalized $1 (ie '+' stripped, '-' '.' replaced by '_')

#/***********************************************************************
#* copyright (c) 2004-2006 MALET Jean-luc aka cityhunter
#* This library is free software; you can redistribute it and/or modify
#* it under the terms of the LGPL v2.1 or latter at your option
#* http://www.gnu.org/copyleft/lesser.html
#************************************************************************/
#set -x
. ${confiserie}/format_name.sh
name=$( format_name "$1")

description=$(eval echo \${${name}_DESC})
test -z "$description" && echo "description for $1 is empty!" >&2 && exit 1

version=$(eval echo \${${name}_VERSION})
test -z "$version" && echo "version for $1 is empty!" >&2 && exit 1

requires=$(eval echo \${${name}_REQUIRES})

libs="$(eval echo \${${name}_LIBS})"
if [ -n "$libs" ] ; then
	libs="$libs -l${1}-${version/.*/}"
fi

headers_dir="$(eval echo \${${name}_HEADERS_DIR})"

cat <<EOF
#Directories
INSTALL_PREFIX=${INSTALL_PREFIX}
BIN_DIR=${BIN_DIR}
SBIN_DIR=${SBIN_DIR}
LIB_DIR=${LIB_DIR}
LIBEXEC_DIR=${LIBEXEC_DIR}
SYS_CONF=${SYS_CONF}
SHARED_DATA_DIR=${SHARED_DATA_DIR}
INCLUDE_DIR=${INCLUDE_DIR}

#Package information
NAME=${1}
DESCRIPTION=${description}
VERSION=${version}
REQUIRES=${requires}
LIBS= -L\${LIB_DIR} ${libs}
CFLAGS= -I\${INCLUDE_DIR}/${headers_dir}


#common variables
prefix=\${INSTALL_PREFIX}
exec_prefix=\${INSTALL_PREFIX}
libdir=\${LIB_DIR}
includedir=\${INCLUDE_DIR}

Name: \${NAME}
Description:\${DESCRIPTION}
Version: \${VERSION}
Requires: \${REQUIRES}
Libs: \${LIBS} 
Cflags: \${CFLAGS}
EOF

