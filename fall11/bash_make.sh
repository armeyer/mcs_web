#!/bin/bash

function internal_actions {
	if [ $6 -eq 1 ]; then
		echo "[make $2 $1]"
		make $2 $1
	fi
	if [ $7 -eq 1 ]; then
		echo "[cp ../mcs-web/$3 $4]"
		cp ../mcs-web/$3 $4
	fi
	if [ $8 -eq 1 ]; then
		echo "[cp ../mcs-web/$3 $5]"
		cp ../mcs-web/$3 $5
	fi
}
function internal_versions {
	previewfolder="ssol/previews"
	if [ $2 -eq 1 ]; then
		internal_actions $1 hidesolutions ${1}.pdf $previewfolder pub $5 $6 $7
	fi
	if [ $3 -eq 1 ]; then
		internal_actions $1 showsolutions ${1}sol.pdf $previewfolder solutions $5 $6 $7
	fi
	if [ $4 -eq 1 ]; then
		internal_actions $1 staffsolutions ${1}-staff.pdf $previewfolder ssol $5 $6 $7
	fi
}

hide=0
show=0
staff=0
make=0
preview=0
publish=0

for arg in $@; do
	echo $arg
	if [ $arg = "-make" ]; then
		make=1
		continue
	fi
	if [ $arg = "-preview" ]; then
		preview=1
		continue
	fi
	if [ $arg = "-publish" ]; then
		publish=1
		continue
	fi
	if [ $arg = "-v0" -o $arg = "-hide" -o $arg = "-hidesolutions" ]; then
		hide=1
		continue
	fi
	if [ $arg = "-v1" -o $arg = "-show" -o $arg = "-showsolutions" ]; then
		show=1
		continue
	fi
	if [ $arg = "-v2" -o $arg = "-staff" -o $arg = "-staffsolutions" ]; then
		staff=1
		continue
	fi
	if [ -e ${arg}.tex ]; then	
		echo "[$arg]: make=$make preview=$preview publish=$publish hide=$hide show=$show staff=$staff"
		internal_versions $arg $hide $show $staff $make $preview $publish
	else
		echo "[$arg]: cannot find ${arg}.tex"
	fi
done

echo make=$make preview=$preview publish=$publish hide=$hide show=$show staff=$staff 
