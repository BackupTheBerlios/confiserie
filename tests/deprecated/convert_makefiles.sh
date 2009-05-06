#/***********************************************************************
#* copyright (c) 2004-2006 MALET Jean-luc aka cityhunter
#* This library is free software; you can redistribute it and/or modify
#* it under the terms of the LGPL v2.1 or latter at your option
#* http://www.gnu.org/copyleft/lesser.html
#************************************************************************/

backup_makefile() {
	cp ${1} ${1}.backup
}

convert_gnu_to_bsd() {
	while read; do
		backup_makefile $REPLY
		sed -i "s:^include:\.include:g;
		        s:^ifdef:\.if defined:g;
		        s:^ifndef:\.if !defined:g;" $REPLY
						if grep $REPLY "^ifeq\|^ifneq\|^override\|^endef\|^export\|^unexport\|^vpath\|"; then
			echo "don't know how to convert.... :(" >&2
			exit 1
		fi
	done
}


convert_bsd_to_gnu() {
	while read; do
		backup_makefile $REPLY
		sed -i "s:^include:\.include:g;
		        s:^ifdef:\.if defined:g;
		        s:^ifndef:\.if !defined:g;" $REPLY
						if grep $REPLY "^ifeq\|^ifneq\|^override\|^endef\|^export\|^unexport\|^vpath\|"; then
			echo "don't know how to convert.... :(" >&2
			exit 1
		fi
	done
}

backIFS=$IFS
IFS=$'\n'
if [ "$1" == GNU_TO_BSD ]; then
	find -type f -name "Makefile*" | convert_gnu_to_bsd
elif [ "$1" == BSD_TO_GNU ]; then
	find -type f -name "Makefile*" | convert_bsd_to_gnu
else
	echo "unkown convertion"
	exit 1
fi
