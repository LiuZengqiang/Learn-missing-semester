#!/usr/bin/env bash
cnt=0
while [[ true ]]; do
	cnt=$[ cnt + 1 ]
	./3-test.sh >> 3-test.log 2>&1
	if [[ $? -ne 0 ]]; then
		cat ./3-test.log
		echo "Error occured after $cnt successful run."
		break
	fi
done
