#!/bin/bash

make 2>&1 >&3 | tee -a $LOGFILE && leave
mkdir -p $prefix/${dirinstall["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
cp -r lib $prefix/${dirinstall["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
cp -r include $prefix/${dirinstall["$index"]} 2>&1 >&3 | tee -a $LOGFILE && leave
cp mod/* $prefix/${dirinstall["$index"]}/include 2>&1 >&3 | tee -a $LOGFILE && leave
