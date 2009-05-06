# Be Posix compatible
if test -n "${ZSH_VERSION+set}" && (emulate sh) >/dev/null 2>&1; then
  emulate sh
  NULLCMD=:
  #~ # Zsh 3.x and 4.x performs word splitting on ${1+"$@"}, which
  #~ # is contrary to our usage.  Disable this feature.
  #~ alias -g '${1+"$@"}'='"$@"'
elif test -n "${BASH_VERSION:+set}" && (set -o posix) >/dev/null 2>&1; then
  set -o posix
fi
DUALCASE=1; export DUALCASE # for MKS sh

# Support unset when possible.
(MAIL=60; unset MAIL) || return 1



