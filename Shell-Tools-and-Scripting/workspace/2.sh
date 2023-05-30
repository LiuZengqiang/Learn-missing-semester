#!/bin/bash
marco(){
	pwd > "$HOME"/current-working-directory.log
	if [ $? -eq 0 ] ; then
		echo "Saved the current working directory."
	else 
		echo "Error occurred when saving the current working directory."
	fi
}

polo(){
	cd "$(cat "$HOME/current-working-directory.log")"
}
