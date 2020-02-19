#!/bin/bash

function SWITCH_TO_LTS {
        #this function will check if  the  prompt is set as lts if not it will switch it to lts 
        if [ "$SWITCH_PROMPT_TO_LTS" = "1" ]; then

          echo "Switching to the 'lts' release channel (if 'never' or 'normal')"
          sed -i 's/Prompt=(never|normal)/Prompt=lts/g' "/etc/update-manager/release-upgrades"

        else

          echo "prompt is already set in lts"

        fi
}

function DISABLE_PPAs {
        #this function will remove the # character in lines that begin with deb.
        sed -i 's/^/#/' /etc/apt/sources.list.d/*.list



}
