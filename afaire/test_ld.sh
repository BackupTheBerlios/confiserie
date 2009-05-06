if [ -z $LD ]; then
	echo "this package require a linker and no LD variable exported!"
	echo "please setup a decent environnement before trying to compile"
	echo "using bash/sh and a GNU environement doing the following "
	echo "export LD=ld"
	echo "see ./configure --help for details about environnement"
	ERROR=TRUE
fi
if [ -z $LDFLAGS ]; then 
	echo "WARNING no LDFLAGS set"
fi
if [ -n $ERROR ]; then
	exit 1;
fi
if ! [ -x $LD ];
#check if -Ur is supported
#else fall back to -r



