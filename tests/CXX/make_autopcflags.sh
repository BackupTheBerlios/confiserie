#!/bin/sh
# $1 : target name
# this script takes information in *_REQUIRES variable and create associated
# CFLAGS and LDFLAGS
# * is $1 canocalized (+ stripped, - and . replaced by _....)

#/***********************************************************************
#* copyright (c) 2004-2006 MALET Jean-luc aka cityhunter
#* This library is free software; you can redistribute it and/or modify
#* it under the terms of the LGPL v2.1 or latter at your option
#* http://www.gnu.org/copyleft/lesser.html
#************************************************************************/


confiserie=${confiserie:=..}

. ${confiserie}/format_name.sh

strip_pc_require() {
	IFS=${OLD_IFS}
	result=""
	while [ "$#" -gt "0" ]; do
		striped=""
		striped="${1/>*/}"
		striped="${striped/=*/}"
		striped="${striped/<*/}"
		result="${result} ${striped}"
		shift
	done
	echo $result
}

OLD_IFS=${IFS}
name=$(format_name "$1")
req=$(IFS=$',';eval strip_pc_require \${${name}_REQUIRES})
pc_cflags="$(pkg-config --cflags $req)"
pc_ldflags="$(pkg-config --libs $req)"
	

cat <<EOF
$1 : CXXFLAGS += ${pc_cflags}
$1 : LDFLAGS += ${pc_ldflags}
EOF
