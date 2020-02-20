#!/bin/bash

function DISABLE_PPAs {
        #this function will add the # character in lines that begin with deb.
	for i in docker-ce.list slack-desktop.list user.list
	do
        sed -i -E 's/^/#/' /etc/apt/sources.list.d/$i
	echo "files has been modified successfully"
	done


}

