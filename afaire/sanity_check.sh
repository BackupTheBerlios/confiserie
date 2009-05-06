

echo "$as_me:$LINENO: checking whether build environment is sane" >&5
echo $ECHO_N "checking whether build environment is sane... $ECHO_C" >&6
# Just in case
sleep 1
echo timestamp > conftest.file
# Do `set' in a subshell so we don't clobber the current shell's
# arguments.  Must try -L first in case configure is actually a
# symlink; some systems play weird games with the mod time of symlinks
# (eg FreeBSD returns the mod time of the symlink's containing
# directory).
if (
   set X `ls -Lt $srcdir/configure conftest.file 2> /dev/null`
   if test "$*" = "X"; then
      # -L didn't work.
      set X `ls -t $srcdir/configure conftest.file`
   fi
   rm -f conftest.file
   if test "$*" != "X $srcdir/configure conftest.file" \
      && test "$*" != "X conftest.file $srcdir/configure"; then

      # If neither matched, then we have a broken ls.  This can happen
      # if, for instance, CONFIG_SHELL is bash and it inherits a
      # broken ls alias from the environment.  This has actually
      # happened.  Such a system could not be considered "sane".
      { { echo "$as_me:$LINENO: error: ls -t appears to fail.  Make sure there is not a broken
alias in your environment" >&5
echo "$as_me: error: ls -t appears to fail.  Make sure there is not a broken
alias in your environment" >&2;}
   { (exit 1); exit 1; }; }
   fi

   test "$2" = conftest.file
   )
then
   # Ok.
   :
else
   { { echo "$as_me:$LINENO: error: newly created file is older than distributed files!
Check your system clock" >&5
echo "$as_me: error: newly created file is older than distributed files!
Check your system clock" >&2;}
   { (exit 1); exit 1; }; }
fi
echo "$as_me:$LINENO: result: yes" >&5
echo "${ECHO_T}yes" >&6
test "$program_prefix" != NONE &&
  program_transform_name="s,^,$program_prefix,;$program_transform_name"
# Use a double $ so make ignores it.
test "$program_suffix" != NONE &&
  program_transform_name="s,\$,$program_suffix,;$program_transform_name"
# Double any \ or $.  echo might interpret backslashes.
# By default was `s,x,x', remove it if useless.
cat <<\_ACEOF >conftest.sed
s/[\\$]/&&/g;s/;s,x,x,$//
_ACEOF
program_transform_name=`echo $program_transform_name | sed -f conftest.sed`
rm conftest.sed

# expand $ac_aux_dir to an absolute path
am_aux_dir=`cd $ac_aux_dir && pwd`

test x"${MISSING+set}" = xset || MISSING="\${SHELL} $am_aux_dir/missing"
# Use eval to expand $SHELL
if eval "$MISSING --run true"; then
  am_missing_run="$MISSING --run "
else
  am_missing_run=
  { echo "$as_me:$LINENO: WARNING: \`missing' script is too old or missing" >&5
echo "$as_me: WARNING: \`missing' script is too old or missing" >&2;}
fi

if mkdir -p --version . >/dev/null 2>&1 && test ! -d ./--version; then
  # Keeping the `.' argument allows $(mkdir_p) to be used without
  # argument.  Indeed, we sometimes output rules like
  #   $(mkdir_p) $(somedir)
  # where $(somedir) is conditionally defined.
  # (`test -n '$(somedir)' && $(mkdir_p) $(somedir)' is a more
  # expensive solution, as it forces Make to start a sub-shell.)
  mkdir_p='mkdir -p -- .'
else
  # On NextStep and OpenStep, the `mkdir' command does not
  # recognize any option.  It will interpret all options as
  # directories to create, and then abort because `.' already
  # exists.
  for d in ./-p ./--version;
  do
    test -d $d && rmdir $d
  done
  # $(mkinstalldirs) is defined by Automake if mkinstalldirs exists.
  if test -f "$ac_aux_dir/mkinstalldirs"; then
    mkdir_p='$(mkinstalldirs)'
  else
    mkdir_p='$(install_sh) -d'
  fi
fi

