#!/bin/bash

#################################################################
#Group 7 : Processing
group=7
groupname[$group]="Processing librairies"

# Ncview 2.1.7
index=1
name["$group-$index"]=ncview
version["$group-$index"]=2.1.7
details["$group-$index"]=""
url["$group-$index"]=ftp://cirrus.ucsd.edu/pub/ncview/ncview-2.1.7.tar.gz
filename["$group-$index"]=ncview-2.1.7.tar.gz
dirname["$group-$index"]=ncview-2.1.7
builder["$group-$index"]="configure"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group-$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.7.3 udunits/$compilo/2.2.28"
else
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3 udunits/$compilo/2.2.28"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
"

# Antlr 2.7.7
index=2
name["$group-$index"]=antlr
version["$group-$index"]=2.7.7
details["$group-$index"]="(required for NCO)"
url["$group-$index"]=http://www.antlr2.org/download/antlr-2.7.7.tar.gz
filename["$group-$index"]=antlr-2.7.7.tar.gz
dirname["$group-$index"]=antlr-2.7.7
patch_01["$group-$index"]="--- antlr-2.7.7/scripts/../lib/cpp/antlr/CharScanner.hpp	2017-11-30 10:36:20.301172303 +0100
+++ antlr-2.7.7/CharScanner.hpp	2017-11-30 10:36:08.845135962 +0100
@@ -9,7 +9,8 @@
  */
 
 #include <antlr/config.hpp>
-
+#include <strings.h>
+#include <stdio.h>
 #include <map>
 
 #ifdef HAS_NOT_CCTYPE_H
"
patchfile_01["$group-$index"]="lib/cpp/antlr/CharScanner.hpp"
builder["$group-$index"]="configure"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group-$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.7.3 udunits/$compilo/2.2.28"
else
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3 udunits/$compilo/2.2.28"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"

# NCO 4.9.0
index=3
name["$group-$index"]=nco
version["$group-$index"]=4.9.0
details["$group-$index"]=""
url["$group-$index"]="https://github.com/nco/nco/archive/4.9.0.tar.gz -O nco-4.9.0.tar.gz"
filename["$group-$index"]=nco-4.9.0.tar.gz
dirname["$group-$index"]=nco-4.9.0
builder["$group-$index"]="configure"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group-$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.7.3 udunits/$compilo/2.2.28 antlr/$compilo/2.7.7"
else
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3 udunits/$compilo/2.2.28 antlr/$compilo/2.7.7"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]="ANTLR_ROOT=$prefix/antlr/$compilo/2.7.7"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"

# Proj 6.1.1
index=4
name["$group-$index"]=proj
version["$group-$index"]=6.1.1
details["$group-$index"]="(required for GDAL)"
url["$group-$index"]=https://github.com/OSGeo/PROJ/releases/download/6.1.1/proj-6.1.1.tar.gz
filename["$group-$index"]=proj-6.1.1.tar.gz
dirname["$group-$index"]=proj-6.1.1
builder["$group-$index"]="configure"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group-$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.7.3 udunits/$compilo/2.2.28"
else
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3 udunits/$compilo/2.2.28"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]="ANTLR_ROOT=$prefix/antlr/$compilo/2.7.7"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/p${dirinstall["$group-$index"]}/include 
"

if [ "$pythonInterpreter" != "none" ]; then # only-if-Python

# pyproj 2.2.0
index=5
name["$group-$index"]=pyproj
version["$group-$index"]=2.2.0
details["$group-$index"]="(version Python)"
url["$group-$index"]="https://files.pythonhosted.org/packages/73/ef/53a7e9e98595baf4d7212aa731fcec256b432a3db60a55b58a027a4d9d47/pyproj-2.2.0.tar.gz"
filename["$group-$index"]=pyproj-2.2.0.tar.gz
dirname["$group-$index"]=pyproj-2.2.0
builder["$group-$index"]="python"
dependencies["$group-$index"]="python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion} proj/$compilo/6.1.1"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

fi  # end-only-if-Python

# GDAL 3.0.1
index=6
name["$group-$index"]=gdal
version["$group-$index"]=3.0.1
details["$group-$index"]="(required for GMT)"
url["$group-$index"]="https://github.com/OSGeo/gdal/releases/download/v3.0.1/gdal-3.0.1.tar.gz"
filename["$group-$index"]=gdal-3.0.1.tar.gz
dirname["$group-$index"]=gdal-3.0.1
builder["$group-$index"]="configure"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group-$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.7.3 udunits/$compilo/2.2.28 proj/$compilo/6.1.1"
	args["$group-$index"]="--with-proj=$prefix/proj/$compilo/6.1.1"
else
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3 udunits/$compilo/2.2.28 proj/$compilo/6.1.1"
	args["$group-$index"]="--with-proj=$prefix/proj/$compilo/6.1.1 LDFLAGS=-lmpi_cxx"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include  
"

#--------------------------------------------------------------
# GDAL Python
if [ "$pythonInterpreter" != "none" ]; then # only-if-Python

# pygdal 3.0.1.5
index=7
name["$group-$index"]=pygdal
version["$group-$index"]=3.0.1.5
details["$group-$index"]="(version Python - require GDAL 3.0.1)"
url["$group-$index"]=https://files.pythonhosted.org/packages/c4/39/480a0e18ba65b070a8dd1a9124a891ea7fea8f58a07b39462d9c94f13ccf/pygdal-3.0.1.5.tar.gz
filename["$group-$index"]=pygdal-3.0.1.5.tar.gz
dirname["$group-$index"]=pygdal-3.0.1.5
builder["$group-$index"]="python"
dependencies["$group-$index"]="gdal/$compilo/3.0.1 python/$compilo/${pythonVersion} python-modules/$compilo/${pythonVersion}"
dirinstall["$group-$index"]="python-modules/$compilo"
args["$group-$index"]=""
#dirmodule["$group-$index"]=""
#modulefile["$group-$index"]=""

fi  # end-only-if-Python

if [ "$showOldVersion" = "1" ]; then

# GDAL 2.4.2
index=8
name["$group-$index"]=gdal
version["$group-$index"]=2.4.2
details["$group-$index"]="required Netcdf-C 4.4.1.1"
url["$group-$index"]="https://download.osgeo.org/gdal/2.4.2/gdal-2.4.2.tar.gz"
filename["$group-$index"]=gdal-2.4.2.tar.gz
dirname["$group-$index"]=gdal-2.4.2
builder["$group-$index"]="configure"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group-$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.4.1.1 udunits/$compilo/2.2.28 proj/$compilo/6.1.1"
else
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.4.1.1 udunits/$compilo/2.2.28 proj/$compilo/6.1.1"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]="--with-proj=$prefix/proj/$compilo/6.1.1 LDFLAGS=-lmpi_cxx"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include  
"

fi # end-old-version

# gshhg-gmt 2.3.7
index=9
name["$group-$index"]=gshhg-gmt
version["$group-$index"]=2.3.7
details["$group-$index"]="(required for GMT)"
url["$group-$index"]="ftp://ftp.soest.hawaii.edu/gmt/gshhg-gmt-2.3.7.tar.gz"
filename["$group-$index"]=gshhg-gmt-2.3.7.tar.gz
dirname["$group-$index"]=gshhg-gmt-2.3.7
builder["$group-$index"]="gmt5-data"
dependencies["$group-$index"]=""
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
#dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
#modulefile["$group-$index"]=""

# dcw-gmt 1.1.4
index=10
name["$group-$index"]=dcw-gmt
version["$group-$index"]=1.1.4
details["$group-$index"]="(required for GMT)"
url["$group-$index"]="ftp://ftp.soest.hawaii.edu/gmt/dcw-gmt-1.1.4.tar.gz"
filename["$group-$index"]=dcw-gmt-1.1.4.tar.gz
dirname["$group-$index"]=dcw-gmt-1.1.4
builder["$group-$index"]="gmt5-data"
dependencies["$group-$index"]=""
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]=""
#dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
#modulefile["$group-$index"]=""

# GMT 5.4.5
index=11
name["$group-$index"]=gmt
version["$group-$index"]=5.4.5
details["$group-$index"]=""
url["$group-$index"]="ftp://ftp.soest.hawaii.edu/gmt/gmt-5.4.5-src.tar.gz"
filename["$group-$index"]=gmt-5.4.5-src.tar.gz
dirname["$group-$index"]=gmt-5.4.5
builder["$group-$index"]="gmt5"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group-$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.7.3 udunits/$compilo/2.2.28 proj/$compilo/6.1.1 gdal/$compilo/3.0.1 lapack-blas/$compilo/3.9.0"
else
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 parallel-netcdf/$mpilib/$compilo/1.12.1 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3 udunits/$compilo/2.2.28 proj/$compilo/6.1.1 gdal/$compilo/3.0.1 lapack-blas/$compilo/3.9.0"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
args["$group-$index"]="-DGSHHG_PATH=$prefix/gshhg-gmt-2.3.7 -DDCW_PATH=$prefix/dcw-gmt-1.1.4"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include  
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
"

# CDO 1.9.7.1
index=12
name["$group-$index"]=cdo
version["$group-$index"]=1.9.7.1
details["$group-$index"]=""
url["$group-$index"]="https://code.mpimet.mpg.de/attachments/download/20124/cdo-1.9.7.1.tar.gz"
filename["$group-$index"]=cdo-1.9.7.1.tar.gz
dirname["$group-$index"]=cdo-1.9.7.1
builder["$group-$index"]="configure"
if [ "$mpilib" == "none" ]; then 
	dependencies["$group-$index"]="zlib/$compilo/1.2.11 hdf5/$compilo/1.10.5 netcdf-c/hdf5.110/$compilo/4.7.3 udunits/$compilo/2.2.28 proj/$compilo/6.1.1"
	args["$group-$index"]="--with-hdf5=$prefix/hdf5/$compilo/1.10.5/ --with-netcdf=$prefix/netcdf/hdf5.110/$compilo/c/4.7.3/ -with-udunits2=$prefix/udunits/$compilo/2.2.28 --with-proj=$prefix/proj/$compilo/6.1.1/"
else
	dependencies["$group-$index"]="$mpi_dep zlib/$compilo/1.2.11 hdf5/$mpilib/$compilo/1.10.5 netcdf-c/hdf5.110/$mpilib/$compilo/4.7.3 udunits/$compilo/2.2.28 proj/$compilo/6.1.1"
	args["$group-$index"]="--with-hdf5=$prefix/hdf5/$mpilib/$compilo/1.10.5/ --with-netcdf=$prefix/netcdf/hdf5.110/$mpilib/$compilo/c/4.7.3/ -with-udunits2=$prefix/udunits/$compilo/2.2.28 --with-proj=$prefix/proj/$compilo/6.1.1/"
fi
dirinstall["$group-$index"]="${name["$group-$index"]}/$compilo/${version["$group-$index"]}"
dirmodule["$group-$index"]="${name["$group-$index"]}/$compilo"
modulefile["$group-$index"]="#%Module1.0
proc ModulesHelp { } {
global dotversion
 
puts stderr \"\t$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"
}
 
module-whatis \"$(tr '[:lower:]' '[:upper:]' <<< ${name["$group-$index"]:0:1})${name["$group-$index"]:1} ${version["$group-$index"]}\"

# Dependencies
module load dependencies_modules

# Variables
prepend-path PATH $prefix/${dirinstall["$group-$index"]}/bin
prepend-path LD_LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path LIBRARY_PATH $prefix/${dirinstall["$group-$index"]}/lib
prepend-path MANPATH $prefix/${dirinstall["$group-$index"]}/share/man
prepend-path C_INCLUDE_PATH $prefix/${dirinstall["$group-$index"]}/include
prepend-path INCLUDE $prefix/${dirinstall["$group-$index"]}/include 
prepend-path CPATH $prefix/${dirinstall["$group-$index"]}/include 
"



