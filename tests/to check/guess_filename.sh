#/***********************************************************************
#* copyright (c) 2004-2006 MALET Jean-luc aka cityhunter
#* This library is free software; you can redistribute it and/or modify
#* it under the terms of the LGPL v2.1 or latter at your option
#* http://www.gnu.org/copyleft/lesser.html
#************************************************************************/
#this script test the file extensions of the executables
#$1 : the programm to compile
echo $TEST_SEPARATOR >&2
echo "$0 : testing executable's extension" >&2
if ${CC} ${CPPFLAGS} ${CFLAGS} ${CC_LDFLAGS} $1 1>/dev/null; then
	# b.out is created by i960 compilers.
	for ac_file in a_out.exe a.exe conftest.exe a.out conftest a.* conftest.* b.out
	do
		test -f "$ac_file" || continue
		case $ac_file in
			*.xcoff | *.tds | *.d | *.pdb | *.xSYM | *.bb | *.bbg | *.o | *.obj )
				;;
			conftest.$ac_ext )
				# This is the source file.
				;;
			[ab].out )
				# We found the default executable, but exeext='' is most
				# certainly right.
				rm -f $ac_file
				break;;
			*.* )
				echo "`expr "$ac_file" : '[^.]*\(\..*\)'`"
				# FIXME: I believe we export ac_cv_exeext for Libtool,
				# but it would be cool to find out if it's true.  Does anybody
				# maintain Libtool? --akim.
				rm -f $ac_file
				break;;
			* )
				break;;
		esac
	done
else
	echo "$0: error: C compiler cannot create executables" >&2
	exit 1
fi

