#!/bin/bash

#--------------------------------
# Installation des entêtes Python & librairies essentielles
sudo apt-get install gfortran g++ git 2>&1 >&3 | tee -a $LOGFILE && leave 1
sudo apt-get install tcl tcl-dev tcllib 2>&1 >&3 | tee -a $LOGFILE && leave 1
sudo apt-get install libfreetype6-dev libpng-dev libx11-dev libxaw7-dev m4 patch make cmake autoconf bison flex libcurl4-gnutls-dev liblzma-dev 2>&1 >&3 | tee -a $LOGFILE && leave 1

if [ "$pythonInterpreter" != "none" ]; then # only-if-Python
	if (( $(echo "$pythonVersion >= 3.0" | bc -l) )); then # only Python>=3.0
		# Python v3.x
		sudo apt-get install python3-dev 2>&1 >&3 | tee -a $LOGFILE && leave 1
		sudo apt-get install python3-distutils 2>&1 >&3 | tee -a $LOGFILE && leave 1
		# GDAL deps
		sudo apt-get install python3-sphinx 2>&1 >&3 | tee -a $LOGFILE && leave 1
	else
		# Python v2.x
		sudo apt-get install python-dev 2>&1 >&3 | tee -a $LOGFILE && leave 1
		# GDAL deps
		sudo apt-get install python-sphinx 2>&1 >&3 | tee -a $LOGFILE && leave 1
	fi
fi  # end-only-if-Python

# GDAL deps
sudo apt-get install sqlite3 libsqlite3-dev 2>&1 >&3 | tee -a $LOGFILE && leave 1
# ecCodes deps
sudo apt-get install libjasper-dev 2>&1 >&3 | tee -a $LOGFILE && leave 1
# Delft3D deps
sudo apt-get install automake libtool uuid-dev 2>&1 >&3 | tee -a $LOGFILE && leave 1




