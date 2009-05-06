#!/bin/sh
#licenced under the GPL, taken from autoconf generated script

# Find a good install program.  We prefer a C program (faster),
# so one script is as good as another.  But avoid the broken or
# incompatible versions:
# SysV /etc/install, /usr/sbin/install
# SunOS /usr/etc/install
# IRIX /sbin/install
# AIX /bin/install
# AmigaOS /C/install, which installs bootblocks on floppy discs
# AIX 4 /usr/bin/installbsd, which doesn't work without a -g flag
# AFS /usr/afsws/bin/install, which mishandles nonexistent args
# SVR4 /usr/ucb/install, which tries to use the nonexistent group "staff"
# OS/2's system install, which has a completely different semantic
# ./install, which can be erroneously created by make from ./install.sh.
WHICH=${WHICH:=which}
confiserie=${confiserie:=..}
. ${confiserie}/confiserie.cache.functions.sh



mytest() {

  run_test() {
    if test -z "$INSTALL"; then
			for INSTALL in $(${WHICH} -a install); do
				case $(uname -s) in
					SysV) [ $INSTALL != /etc/install ]     && 
					      [ $INSTALL != /usr/sbin/install] &&
								return 0;;
					SunOs) [ $INSTALL != /usr/etc/install ] && return 0;;
					IRIX) [ $INSTALL != /sbin/install ] && return 0;;
					AIX) [ $INSTALL != /bin/install ]   &&
					     [ $INSTALL != /usr/bin/installbsd ] && return 0;;
					AmigaOS) [ $INSTALL != /C/install ] && return 0;;
					AFS) [ $INSTALL != /usr/afsws/bin/install ] && return 0;;
					SVR4) [ $INSTALL != /usr/ucb/install ] && return 0;;
					OS/2) ;;
					*) return 0;;
				esac
			done
		fi
  }

  echo $TEST_SEPARATOR >&2
  run_test 
  echo "checking for install : " >&2
	if [ -z "$INSTALL" ]; then
		echo not found >&2
		return 1
	fi
	conf_cache INSTALL
}

mytest
