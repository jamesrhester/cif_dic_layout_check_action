#!/bin/bash
# get Julia tools 

git clone https://github.com/jamesrhester/julia_cif_tools
git clone https://github.com/COMCIFS/cif_core

# run the checks

shopt -s nullglob

whoami

pwd

echo $HOME
julia -e 'import Pkg;Pkg.status()'

for file in *.dic
do	
	echo Checking $file ....
	julia julia_cif_tools/linter.jl $file cif_core/ddl.dic
	if [ $? != 0 ] 
	then 
		exit 1 ;
	fi 
done

