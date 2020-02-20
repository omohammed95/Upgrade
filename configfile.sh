#!/bin/bash

function SWITCH_TO_LTS {
        #this function will check if  the  prompt is set as lts if not it will switch it to lts.
        TEST=cat | grep "Prompt=lts" /etc/update-manager/release-upgrades 
        if [ "$TEST" = "0" ]; then
           echo "prompt is already set in lts"
        else
           echo "Switching to the 'lts' release channel (if 'never' or 'normal')"
           sed -i -E 's/Prompt=(never|normal)/Prompt=lts/g' "/etc/update-manager/release-upgrades"


        fi

}
        
function DISABLE_PPAs {
        #this function will add the # character in lines that begin with deb.
	for i in docker-ce.list slack-desktop.list user.list
	do
        sed -i -E 's/^/#/' /etc/apt/sources.list.d/$i
	echo "files has been modified successfully"
	done


}

SWITCH_TO_LTS
DISABLE_PPAs
