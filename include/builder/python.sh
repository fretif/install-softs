#!/bin/bash

if [ ! -d "$prefix/${dirinstall["$index"]}/bin" ] ; then mkdir -p "$prefix/${dirinstall["$index"]}/bin" 2>&1 >&3 | tee -a $LOGFILE && leave; fi
if [ ! -d "$prefix/${dirinstall["$index"]}/include/$pythonInterpreter" ] ; then mkdir -p "$prefix/${dirinstall["$index"]}/include/$pythonInterpreter" 2>&1 >&3 | tee -a $LOGFILE && leave; fi
if [ ! -d "$prefix/${dirinstall["$index"]}/lib/$pythonInterpreter/site-packages" ] ; then mkdir -p "$prefix/${dirinstall["$index"]}/lib/$pythonInterpreter/site-packages" 2>&1 >&3 | tee -a $LOGFILE && leave; fi

export PYTHONUSERBASE=$prefix/${dirinstall["$index"]}
if [[ "$compiler" == "intel" ]] ; then
	LDSHARED="icc -shared" $pythonInterpreter setup.py install --user 2>&1 >&3 | tee -a $LOGFILE && leave
else
	$pythonInterpreter setup.py install --user 2>&1 >&3 | tee -a $LOGFILE && leave
fi	
