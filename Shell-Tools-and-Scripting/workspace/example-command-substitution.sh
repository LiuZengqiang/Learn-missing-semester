#!/bin/bash 
echo "Starting program ar $(date)"

echo "Runing program $0 with $# argument with pid $$"

for file in "$@"; do
	#grep foobar "$file" > /dev/null 2> /dev/null
	#if [[ $? -ne 0 ]]; then
	if ! grep foobar "$file" > /dev/null 2> /dev/null ; then
		echo "File $file does not have any foobar, adding one"
		echo "# foobar" >> "$file"
	fi
done
