#!/bin/bash -l
# get Julia tools 

git clone https://github.com/jamesrhester/julia_cif_tools
git clone https://github.com/COMCIFS/cif_core

# run the checks

shopt -s nullglob

for file in *.dic
do	
	echo Checking $file ....
	/usr/local/julia/bin/julia julia_cif_tools/linter.jl $file cif_core/ddl.dic
	if [ $? != 0 ] 
	then 
		exit 1 ;
	fi 
done

