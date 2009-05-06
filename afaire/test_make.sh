ho "$as_me:$LINENO: checking whether ${MAKE-make} sets \$(MAKE)" >&5
echo $ECHO_N "checking whether ${MAKE-make} sets \$(MAKE)... $ECHO_C" >&6
set dummy ${MAKE-make}; ac_make=`echo "$2" | sed 'y,:./+-,___p_,'`
if eval "test \"\${ac_cv_prog_make_${ac_make}_set+set}\" = set"; then
  echo $ECHO_N "(cached) $ECHO_C" >&6
else
  cat >conftest.make <<-_ACEOF
	all:
		@echo 'ac_maketemp="$(MAKE)"'
	_ACEOF
	# GNU make sometimes prints "make[1]: Entering...", which would confuse us.
	eval `${MAKE-make} -f conftest.make 2>/dev/null | grep temp=`
	if test -n "$ac_maketemp"; then
		eval ac_cv_prog_make_${ac_make}_set=yes
	else
		eval ac_cv_prog_make_${ac_make}_set=no
	fi
	rm -f conftest.make
fi
if eval "test \"`echo '$ac_cv_prog_make_'${ac_make}_set`\" = yes"; then
  echo "$as_me:$LINENO: result: yes" >&5
	echo "${ECHO_T}yes" >&6
  SET_MAKE=
else
  echo "$as_me:$LINENO: result: no" >&5
	echo "${ECHO_T}no" >&6
  SET_MAKE="MAKE=${MAKE-make}"
fi
