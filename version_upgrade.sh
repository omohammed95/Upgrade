#!/bin/bash 

function UPGRADE{

	#Tthis function will upgrade your system to new release
	# make sure that the release upgrade option is LTS for the new disturbution release  
	do-release-upgrade -d
       echo "have a fun with your new release!!!"
}
