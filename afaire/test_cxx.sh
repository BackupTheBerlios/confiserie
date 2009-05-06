#/bin/sh
if [ -z $CXX ]; then
	echo "this package require a C++ compiler and no CXX variable exported!"
	echo "please setup a decent environnement before trying to compile"
	echo "using bash/sh and a GNU environement doing the following "
	echo "should fix the issue"
	echo "export CXX=g++"
	ERROR=TRUE
fi
if [ -z $CXXFLAGS ]; then 
	echo "this package require a C++ compiler and no CXXFLAGS variable exported!"
	echo "please setup a descent environnement before trying to compile"
	echo "using bash/sh and a GNU environement doing the followind "
	echo "should fix the issue, see man gcc for options"
	echo "export CXXFLAGS='-O2'"
	ERROR=TRUE
fi
if [ -n "$ERROR" ]; then
	exit 1;
fi


echo "checking for C++ compiler version" >&2
echo "$($CXX --version </dev/null 2>/dev/null ||
        $CXX -v </dev/null  2>/dev/null ||
				$CXX -V </dev/null 2>/dev/null )" >&2

if ! ${CXX} -o mytest ${CPPFLAGS} ${CXXFLAGS} ${LDFLAGS} $confiserie/simple_c.c 1>/dev/null; 
then
	echo "error in compiling simple_c.c" >&2
	echo "the command issued was ${CXX} -o test ${CPPFLAGS} ${CXXFLAGS} ${LDFLAGS} $confiserie/simple_c.c" >&2
	rm -f mytest
	exit 1 
fi
# Check the compiler produces executables we can run.  If not, either
# the compiler is broken, or we cross compile.
echo -n "$0: checking whether the CXX compiler works : " >&2
# FIXME: These cross compiler hacks should be removed for Autoconf 3.0
# If not cross compiling, check that we can run a simple program.
if test "$cross_compiling" != yes; then
	if ! ./mytest; then
		echo "no" >&2
		echo "$0: error: cannot run C compiled programs. " >&2
		echo "If you meant to cross compile, use --crosscompile". >&2
		rm -f mytest
		exit 1;
	fi
fi
echo "yes" >&2
rm -f mytest

#we don't need to export them to makefile since the user has exported the 
#environnement variables


