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
run_test() {
	if test -z "$INSTALL"; then
		as_save_IFS=$IFS; IFS=:
		for as_dir in $PATH
		do
			IFS=$as_save_IFS
			test -z "$as_dir" && as_dir=.
			# Account for people who put trailing slashes in PATH elements.
			case $as_dir/ in
				./ | .// | /cC/* | \
				/etc/* | /usr/sbin/* | /usr/etc/* | /sbin/* | /usr/afsws/bin/* | \
				?:\\/os2\\/install\\/* | ?:\\/OS2\\/INSTALL\\/* | \
				/usr/ucb/* ) ;;
				*)
				# OSF1 and SCO ODT 3.0 have their own names for install.
				# Don't use installbsd from OSF since it installs stuff as root
				# by default.
				for ac_prog in ginstall scoinst install; do
					if [ -x "$as_dir/$ac_prog" ]; then
						if test $ac_prog = install &&
							grep dspmsg "$as_dir/$ac_prog" >/dev/null 2>&1; then
							# AIX install.  It has an incompatible calling convention.
							:
						elif test $ac_prog = install &&
							grep pwplus "$as_dir/$ac_prog" >/dev/null 2>&1; then
							# program-specific install script used by HP pwplus--don't use.
							:
						else
							ac_cv_path_install="$as_dir/$ac_prog -c"
							break 3
						fi
					fi
				done
				;;
			esac
		done
		if test "${ac_cv_path_install+set}" = set; then
			install=$ac_cv_path_install
		else
			# As a last resort, use the slow shell script.  We don't cache a
			# path for INSTALL within a source directory, because that will
			# break other packages using the cache if that directory is
			# removed, or if the path is relative.
			install=$PWD/$confiserie/install.sh
		fi
	fi
	echo "CTAGS=$install" >&1
}

exit 1
echo $TEST_SEPARATOR >&2
echo "$0:checking for a BSD-compatible install : " >&2
$run_test 2>/dev/null | confiserie/create_make_inc.sh 

