#!/bin/bash

function pause
{
	read -t$1 -n1 -r -p "Press any key or wait $1 seconds to continue..." key
	echo
}

function add_path
{
	pathh="$(reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PATH|grep PATH|sed 's| \+| |g'|cut -d" " -f4-)"
	
	if [[ $pathh =~ *"$1"* ]]; then
		setx PATH "$1;$pathh" /m
		if [[ $? != 0 ]]; then
			echo "'$1' could not be added to PATH"
			pause 20
			exit 1
		fi
		echo "added  '$1'"
	else
		echo "exists '$1'"
	fi
}

echo "Adding custom %PATH% entries"

add_path "C:\ProgramData\Oracle\Java\javapath"
add_path "C:\Program Files\Java\jdk1.8.0_121\bin"
add_path "C:\Program Files\Cygwin_64_bit\bin"
add_path "C:\Program Files (x86)\Git\cmd"

pause 1
